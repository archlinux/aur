# Maintainer: Jesin <Jesin00@gmail.com>
# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Contributor: George Giorgidze <giorgidze@gmail.com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=camlp5-transitional-git
pkgver=7.08
pkgrel=1
arch=(x86_64)
pkgdesc='A preprocessor-pretty-printer of OCaml. (transitional)'
conflicts=(camlp5 camlp5-git camlp5-transitional)
provides=(camlp5 camlp5-git camlp5-transitional)
url='https://camlp5.github.io/'
license=(BSD)
depends=(ocaml)
sha256sums=(SKIP)
source=('git+https://github.com/camlp5/camlp5')
options=(staticlibs)

pkgver() {
	cd camlp5
	git describe --tags | sed -E 's/^rel([0-9])([0-9]{2})([0-9]+)/\1.\2.\3/ ; s/^rel([0-9])([0-9]{2})/\1.\2/ ; s/-/+/g'
}

build() {
	cd camlp5
	./configure -prefix /usr -mandir /usr/share/man -transitional
	make
}

package() {
	cd camlp5
	make "DESTDIR=$pkgdir" install
	install -Dm644 "-t$pkgdir/usr/share/licenses/camlp5" LICENSE
}
