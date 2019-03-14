# Maintainer: Yuki Ibe <yibe at yibe.org>
# Contributor: Ken Swenson <flat@imo.uto.moe>
pkgname=open-jtalk
pkgver=1.11
pkgrel=1
pkgdesc="A Japanese text-to-speech synthesis system"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/open-jtalk/"
license=('BSD')
depends=('gcc-libs')
makedepends=('hts-engine')
source=("https://downloads.sourceforge.net/project/open-jtalk/Open%20JTalk/open_jtalk-$pkgver/open_jtalk-$pkgver.tar.gz")
sha1sums=('de8f290664e3bfd7a071a0f6db9e949c4eedb306')

build() {
	cd "open_jtalk-$pkgver"
	./configure --prefix=/usr --with-hts-engine-header-path=/usr/include --with-hts-engine-library-path=/usr/lib
	make
}

package() {
	cd "open_jtalk-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mv "${pkgdir}/usr/dic" "${pkgdir}/usr/share/${pkgname}/dic"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 mecab-naist-jdic/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING-dic"
}
