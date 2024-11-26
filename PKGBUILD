# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=deltalake
pkgname="python-${_name}"
pkgver=0.22.0
pkgrel=3
pkgdesc="Native Delta Lake Python binding based on delta-rs with Pandas integration"
arch=("x86_64")
url="https://delta.io/"
license=('MIT')
depends=('python' 'python-pyarrow')
options=('!lto')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyspark: for spark integration')
makedepends=(python-build python-installer python-wheel python-maturin)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('cbcac3b2b912ee7fb90ef9162c0df67f90e7f41a4b6a01f06a37bdc744f9971072f3e46ccb4f5e40acca5fc44cbef66003611d4dfa279b1b4e7eccd29d8f96be')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}


package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
