# Maintainer: doublesack <doublesackI@gmail.com>
pkgname=('python-osqp')
_module='osqp-python'
pkgver=v0.5.0
pkgrel=1
pkgdesc="Python interface for OSQP (Operator Splitting QP Solver)"
url="http://github.com/oxfordcontrol/osqp-python"
depends=(
    'python-numpy'
    'python-scipy'
    ) 
makedepends=('python-setuptools'
	     'python-pytest')
provides=('python-osqp')
conflicts=('python-osqp-git')
license=('Apache')
arch=('x86_64')
source=("git://github.com/oxfordcontrol/osqp-python.git#tag=${pkgver}"
	"git://github.com/oxfordcontrol/osqp.git"
	"git://github.com/oxfordcontrol/qdldl.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)


prepare() {
	cd osqp-python
	git submodule init
	git config submodule.osqp.url ${srcdir}/osqp
	cd ../osqp/
	git config submodule.qdldl.url ${srcdir}/qdldl
	cd ../osqp-python/
	git submodule update --init --recursive
}
#pkgver() {
  #cd osqp-python
  #git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}
build() {
    cd osqp-python
    python setup.py build
}

package() {
    cd osqp-python
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

#check() {
#	cd osqp-python
#	python -m pytest --pyargs osqp.tests
#}
