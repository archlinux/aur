# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Maintainer: Štěpán Němec <stepnem@smrk.net>
pkgname=knfmt
pkgver=5.3.1
pkgrel=1
pkgdesc='C code formatter (OpenBSD KNF, limited .clang-format support)'
arch=(x86_64)
url=https://github.com/mptre/knfmt
license=(ISC)
depends=(gcc-libs glibc)
source=(https://github.com/mptre/knfmt/releases/download/v"$pkgver"/knfmt-"$pkgver".tar.gz)
sha256sums=('e0086a8dc93d94515b4f77e591c8b14a2f4911215fc0e538471127ffeff3cc9f')

build() {
	cd "$pkgname-$pkgver"
	MANDIR=/usr/share/man PREFIX=/usr ./configure
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
