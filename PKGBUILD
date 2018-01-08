# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-ffc-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ffc
_fragment="#tag=2017.1.0"
pkgname=python-${_base}
pkgdesc="A compiler for finite element variational forms (stable)."
pkgver=20170509
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-ffc-git')
depends=('python-dijitso' 'python-fiat' 'python-ufl') # Will need pybind11 in future
makedepends=('git')
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
