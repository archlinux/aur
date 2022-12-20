# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=maturin
pkgname="python-${_name}"
pkgver=0.14.7
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings"
arch=("x86_64")
url="https://www.maturin.rs/"
license=('MIT')
depends=('python' 'python-tomli' 'maturin')
optdepends=('python-pypatchelf')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("13b91ee6df28b43b2a0d79672a7ff73c47eedfb094d862dcebf7c8ac17b39741ebf61613418eade609a4eb46fb32a3c5938da0901c567ed50d9ffbba6192b5af")

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
