# Maintainer: a821
# Contributor: Angel de Vicente <angel.vicente.garrido at gmail dot com>

pkgname="parallel-git"
pkgver=20251222.r0.g1e3e1eb9
pkgrel=1
pkgdesc="A shell tool for executing jobs in parallel"
arch=('any')
url="https://www.gnu.org/software/parallel/"
license=('GPL-3.0-or-later')
depends=('perl' 'texinfo')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.savannah.gnu.org/git/parallel.git"
	'0001-Remove-citation-things.patch'
	'0002-skip-rst-pdf-generation.patch')
sha256sums=('SKIP'
            'c461c906f3d15194da5e5ba13f359bcfa693315b1991ceb3f02415600115ffc4'
            '85eae9f01bdb8d7ab14b0a3e266ae7e9d5582b77b2a81493225daddedab87e7e')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1g/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	cat ../*.patch | patch -p1
	autoreconf -fvi
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
