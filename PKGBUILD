# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=maturin
pkgname="python-${_name}"
pkgver=0.14.4
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings as well as rust binaries as python packages."
arch=("x86_64")
url="https://www.maturin.rs/"
license=('MIT')
depends=('python' 'python-tomli')
optdepends=('python-pypatchelf')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("b4fce1e6ba8af88aa22cc59f42623fb5dde01880fa1a7f04ffe0787dbd70e17e5ec1f481b504c76b7b1ecb1873bc3ecd47719496a08f8901810dc4731d93faaa")

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}


package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # The `maturin` binary is provided separately by the maturin package.
    rm "$pkgdir/usr/bin/maturin"
}
