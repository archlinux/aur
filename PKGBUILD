# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Maintainer: Štěpán Němec <stepnem@smrk.net>
pkgname=knfmt
pkgver=4.1.1
pkgrel=1
pkgdesc='OpenBSD KNF-style (Kernel Normal Form) C code formatter'
arch=(x86_64)
url=https://github.com/mptre/knfmt
license=(ISC)
depends=(glibc)
source=(https://github.com/mptre/knfmt/releases/download/v"$pkgver"/knfmt-"$pkgver".tar.gz)
sha256sums=('d9a98bb7659a725dd729f655bb2ffa059bf41fc6bb78db15149d037a566d9848')

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
