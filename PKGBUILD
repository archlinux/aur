# Maintainer: Ivy Foster <iff@archlinux.org>
# Reference: PKGBUILD(5)

pkgname=hitch
pkgver=1.7.2
pkgrel=2
pkgdesc='libev-based high performance SSL/TLS proxy'
url='https://hitch-tls.org/'
license=(BSD)

depends=(libev openssl)
checkdepends=(lsof)
makedepends=(python-docutils)

arch=(x86_64)
source=("https://hitch-tls.org/source/hitch-$pkgver.tar.gz")
# sha256sums source: https://hitch-tls.org/source/SHA256SUM
sha256sums=('dcd65cbec6287c622a5a317d5f37e1ea5526daa93fb4db28f4206fc9911a1785')
validpgpkeys=(584A3EBFE705CDCD)

build() {
	cd "hitch-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
	make
}

check() {
	cd "hitch-$pkgver"
	make check
}

package() {
	cd "hitch-$pkgver"
	make DESTDIR="$pkgdir" install
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/hitch/LICENSE"
}
