# Maintainer: Ivy Foster <iff@archlinux.org>

# Note: this PKGBUILD uses makepkg's git signature checking feature.
# You're going to want the key
# CB33B736591A9CA06098A9A5FCAC9CF5A6EE1209
# in particular. Please feel free to double check me on that.

pkgname=ddate-git
pkgver=0.3.0.r0.ga52c0f7
pkgrel=1
pkgdesc='Perpetual date converter from Gregorian to POEE calendar'
url=https://github.com/escondida/ddate
license=(custom:PublicDomain)

depends=(gcc-libs)
makedepends=(git)
provides=(ddate)
conflicts=(ddate)

arch=(x86_64)
source=(git+https://github.com/escondida/ddate.git?signed)
sha256sums=(SKIP)

pkgver() {
	cd ddate
	git describe --long | sed 's@-\(.*\)-@.r\1.@'
}

build() {
	cd ddate
	make PREFIX=/usr
}


package() {
	cd ddate
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/ddate-git/LICENSE"
}
