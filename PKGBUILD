# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-swiglpk-git
pkgver=4.65.1.r1.gec985c1
pkgrel=3
pkgdesc='A Python interface to the GLPK optimization solver. Git version.'
arch=('any')
url='https://github.com/biosustain/swiglpk'
license=('GPL3')
depends=('python' 'glpk')
makedepends=('git' 'swig' 'python-setuptools')
provides=('python-swiglpk')
conflicts=('python-swiglpk')
source=("swiglpk::git+https://github.com/biosustain/swiglpk.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/swiglpk"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/swiglpk"

	# Work around https://github.com/biosustain/swiglpk/issues/40.
	cp /usr/include/glpk.h .
}

build() {
	cd "${srcdir}/swiglpk"
	python setup.py build
}

check() {
	cd "${srcdir}/swiglpk/build/lib."*
	python -Bc "import swiglpk"
}

package() {
	cd "${srcdir}/swiglpk"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

