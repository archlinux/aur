# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=maturin
pkgname="python-${_name}"
pkgver=0.14.6
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings"
arch=("x86_64")
url="https://www.maturin.rs/"
license=('MIT')
depends=('python' 'python-tomli' 'maturin')
optdepends=('python-pypatchelf')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("4b3f521e5690400b92cb625c23c3b84811d2af77d941ad0d680a8535c358deca0be934447f4b2e9e2ae8daa72d282d793adf880e74c3f9e338aceaf36e72a05f")

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
