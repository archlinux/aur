# Maintainer: Ivy Foster <iff@archlinux.org>
# Reference: PKGBUILD(5)

pkgname=hitch
pkgver=1.6.0
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
sha256sums=(4e47eb4abb7dd3809c84283588adf41ddf0c7bc065cb00d0928274889c07c706)
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
