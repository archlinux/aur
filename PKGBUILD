# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
_fragment="#branch=master"
pkgname=python-${_base}-git
pkgdesc="Mesh generation component of FEniCS (python interafce)"
pkgver=20180104
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics-git')
depends=('mshr-git')
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

pkgver() {
	cd ${_base}
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ${_base}/python
	python setup.py build
}

package() {
	cd ${_base}/python
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
