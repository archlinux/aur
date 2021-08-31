# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dijitso
pkgname=python-${_base}-git
pkgdesc="A Python module for distributed just-in-time shared library building"
pkgver=2019.1.0.1.gc92dcb0
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/dijitso"
license=('GPL3')
groups=('fenics-git')
depends=('python-numpy')
makedepends=('git' 'python-setuptools')
optdepends=('python-mpi4py: for running tests with MPI')
options=(!emptydirs)
source=("${_base}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_base}"
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
	cd dijitso
	python setup.py build
}

package() {
	cd dijitso
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
