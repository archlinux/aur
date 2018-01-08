# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-dijitso-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dijitso
_fragment="#tag=2017.1.0"
pkgname=python-${_base}
pkgdesc="A Python module for distributed just-in-time shared library building (stable)."
pkgver=20170509
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-dijitso-git')
depends=('python-numpy')
makedepends=('git')
optdepends=('mpi4py: for running tests with MPI')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

pkgver() {
	cd ${_base}
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ${_base}
	python setup.py build
}

package() {
	cd ${_base}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
