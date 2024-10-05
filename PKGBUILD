# Maintainer: Martin Pollow <martin dot pollow at gmail dot com>

pkgname=python-bempp-cl
_pyname=bempp-cl
pkgver=0.3.2
pkgrel=1
pkgdesc='A fast Python based just-in-time compiling boundary element library'
arch=('x86_64')
url="https://github.com/bempp/bempp-cl"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-numba' 'python-meshio' 'python-llvmlite')
makedepends=('python-setuptools' 'python-pip')
optdepends=('python-plotly: data visualization'
    'python-pyopencl: GPU computation'
    'gmsh: meshing and visualization')
provides=('python-bempp')
conflicts=('python-bempp')
source=(${_pyname}-${pkgver}.tar.gz::"https://github.com/bempp/bempp-cl/archive/v${pkgver}.tar.gz")
sha256sums=('66cf8578b56b0084c9de4a993de01959cf210b1d377ba73fe196057d5baad80c')

build() {
	cd "$srcdir/$_pyname-$pkgver"
	python -m build
}

package() {
	cd "$srcdir/$_pyname-$pkgver"
        PIP_CONFIG_FILE=/dev/null python -m pip install --root="$pkgdir" --no-deps --no-warn-script-location

	cd "$pkgdir"
	install -m0644 -D "$srcdir/$_pyname-$pkgver"/LICENSE usr/share/licenses/$pkgname/LICENSE
	chmod -R a+r usr
}

