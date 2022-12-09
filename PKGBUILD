# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=maturin
pkgname="python-${_name}"
pkgver=0.14.5
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings"
arch=("x86_64")
url="https://www.maturin.rs/"
license=('MIT')
depends=('python' 'python-tomli' 'maturin')
optdepends=('python-pypatchelf')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("c145224edb4706f4f895cae4f4fbf194e0e2a1b0e921f7ca90737dcbdfa4d8f4a9fa4eb234cb97d372d37bc15f3ec8b7b1b5aab5176e3fd523b88bcb8a5e932e")

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
