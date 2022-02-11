# Maintainer: doublesack <doublesackI@gmail.com>
pkgname=('python-qdldl')
_module='qdldl-python'
pkgver=v0.1.5.post0
pkgrel=2
pkgdesc="Python interface to the QDLDL free LDL factorization routine for quasi-definite linear systems: Ax = b"
url="https://github.com/osqp/qdldl-python"
depends=(
    'python-numpy'
    'python-scipy'
    ) 
makedepends=('python-setuptools'
	     'pybind11'
	     'cmake')
provides=('python-qdldl')
conflicts=('python-qdldl-git')
license=('Apache')
arch=('x86_64')
source=("git://github.com/osqp/qdldl-python.git#tag=${pkgver}"
	"git://github.com/osqp/qdldl.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
)


prepare() {
	cd qdldl-python
	git submodule init
	git config submodule.qdldl.url ${srcdir}/qdldl
	git submodule update --init --recursive
}
#pkgver() {
  #cd osqp-python
  #git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}
build() {
    cd qdldl-python
    python setup.py build
}

package() {
    cd qdldl-python
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

#check() {
#	cd osqp-python
#	python -m pytest --pyargs osqp.tests
#}
