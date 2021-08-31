# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ufl
pkgname=python-${_base}-git
pkgdesc="Unified form language."
pkgver=2021.1.0.9.gcf8d177c
pkgrel=1
arch=('any')
url="https://github.com/FEniCS/ufl"
license=('GPL3')
groups=('fenics-git')
depends=('python-numpy')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("${_base}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_base}"
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
	cd ufl
	python setup.py build
}

package() {
	cd ufl
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
