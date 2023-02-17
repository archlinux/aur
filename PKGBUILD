# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=deltalake
pkgname="python-${_name}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Native Delta Lake Python binding based on delta-rs with Pandas integration"
arch=("x86_64")
url="https://delta.io/"
license=('MIT')
depends=('python' 'python-pyarrow')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyspark: for spark integration')
makedepends=(python-build python-installer python-wheel) # python-maturin )  # This is only required with using --no-isolation
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("9a6d5d0b6f99848ef9f138483bb73b9e30554d1a44f57fb289841bd4d4703ffb483e251987fd8e17a5152ca4c7e145da321ad5a4d84e3a11e677b8ca6e7593f4")

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}


package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
