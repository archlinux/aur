# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-bempp-cl
_pyname=bempp-cl
pkgver=0.2.2
pkgrel=1
pkgdesc='A fast Python based just-in-time compiling boundary element library'
arch=('x86_64')
url="https://github.com/bempp/bempp-cl"
license=(MIT)
depends=('python' 'python-numpy' 'python-scipy' 'python-numba' 'python-meshio' 'python-llvmlite')
makedepends=('python-setuptools')
optdepends=('python-plotly: data visualization'
    'python-pyopencl: GPU computation'
    'gmsh: meshing and visualization')
provides=('python-bempp')
conflicts=('python-bempp')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/bempp/bempp-cl/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pyname-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"

	cd "$pkgdir"
	install -m0644 -D "$srcdir/$_pyname-$pkgver"/LICENSE.md usr/share/licenses/$pkgname/LICENSE.md
	chmod -R a+r usr
}

