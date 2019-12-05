# Maintainer: Ivy Foster <iff@archlinux.org>
# Reference: PKGBUILD(5)

pkgname=hitch
pkgver=1.5.2
pkgrel=1
pkgdesc='libev-based high performance SSL/TLS proxy'
url='https://hitch-tls.org/'
license=(BSD)

depends=(libev openssl)
checkdepends=(lsof)
makedepends=(python-docutils)

arch=(x86_64)
source=("https://hitch-tls.org/source/hitch-$pkgver.tar.gz")
# sha256sums source: https://hitch-tls.org/source/SHA256SUM
sha256sums=(b1a4fd64584cd4ff816b8513ee5522db34a4431747057421b6e870f722c6dfda)
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
