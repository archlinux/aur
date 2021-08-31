# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ffc
pkgname=python-${_base}-git
pkgdesc="A compiler for finite element variational forms."
pkgver=0.1.0.19.g4a4714ad
pkgrel=1
arch=('any')
url="https://github.com/FEniCS/ffcx"
license=('GPL3')
groups=('fenics-git')
depends=('python-dijitso-git' 'python-fiat-git' 'python-ufl-git' 'pybind11')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("${_base}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_base}"
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
	cd ffc
	python setup.py build
}

package() {
	cd ffc
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
