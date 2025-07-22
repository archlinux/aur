# Maintainer: a821
# Contributor: Angel de Vicente <angel.vicente.garrido at gmail dot com>

pkgname="parallel-git"
pkgver=20250722.r0.gdbe16e17
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
            '341e1c3c63e8621939b9886049de92ab504fa367d5719d5e7bd4418572d82bf9'
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


