# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=deltalake
pkgname="python-${_name}"
pkgver=0.25.4
pkgrel=1
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
b2sums=('82ac3d99f33ffdaa542c7f832ac3033a65260a4ff7fd6cef745f44aa042333e9037cf6cbf43a492b45596940d4e9be2f71a9c7db577f70f2cbac3f710f7664d2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}


package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
