# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=maturin
pkgname="python-${_name}"
pkgver=0.14.13
pkgrel=2
pkgdesc="Build and publish crates with pyo3, rust-cpython, cffi and uniffi bindings"
arch=("x86_64")
url="https://www.maturin.rs/"
license=('MIT')
depends=('python' 'python-tomli' 'maturin')
optdepends=('python-pypatchelf')  # TODO: include python-zig when/if it's available in AUR
makedepends=(python-build python-installer python-wheel python-setuptools python-tomli python-setuptools-rust)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("4218f272ce76b8b2d17db82282552b82ab51d45165bbafb4f2c9b54c872af9716b19d6ebc7dc87a65f615061fcb23d002b855391a3e8aa6142ead58934e766b9")

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}


package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp license-apache license-mit "$pkgdir/usr/share/licenses/$pkgname/"

    # The `maturin` binary is provided separately by the maturin package.
    rm "$pkgdir/usr/bin/maturin"
}
