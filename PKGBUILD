# Maintainer: doublesack <doublesackI@gmail.com>
pkgname=('python-qdldl')
_module='qdldl-python'
pkgver=v0.1.5.post0
pkgrel=3
pkgdesc="Python interface to the QDLDL free LDL factorization routine for quasi-definite linear systems: Ax = b"
url="https://github.com/osqp/qdldl-python"
depends=(
    'python-numpy'
    'python-scipy'
    ) 
makedepends=('python-setuptools'
	     'pybind11'
	     'python-wheel'
	     'python-build'
	     'python-installer'
	     'cmake')
provides=('python-qdldl')
conflicts=('python-qdldl-git')
license=('Apache')
arch=('x86_64')
source=("git+https://github.com/osqp/qdldl-python.git#tag=${pkgver}"
	"git+https://github.com/osqp/qdldl.git"
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

build() {
    cd qdldl-python
    python -m build --wheel --no-isolation
}

package() {
    cd qdldl-python
    python -m installer --destdir="$pkgdir" dist/*.whl
}
