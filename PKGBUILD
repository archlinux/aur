# Maintainer: Ken Swenson <flat@imo.uto.moe>
pkgname=open-jtalk
pkgver=1.10
pkgrel=1
pkgdesc="Open JTalk is a Japanese text-to-speech synthesis system. This software is released under the Modified BSD license."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/open-jtalk/"
license=('BSD')
depends=('gcc-libs-multilib')
makedepends=('hts-engine')
source=("https://downloads.sourceforge.net/project/open-jtalk/Open%20JTalk/open_jtalk-$pkgver/open_jtalk-$pkgver.tar.gz")
md5sums=('2279e87a9e6076d9eeae08c2e70173ef')

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
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
