# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

_name=deltalake
pkgname="python-${_name}"
pkgver=0.6.4
pkgrel=1
pkgdesc="Native Delta Lake Python binding based on delta-rs with Pandas integration"
arch=("x86_64")
url="https://delta.io/"
license=('MIT')
depends=('python' 'python-pyarrow' 'python-typing_extensions')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyspark: for spark integration')
makedepends=(python-build python-installer python-wheel) # python-maturin )  # This is only required with using --no-isolation
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=(SKIP)

build() {
    cd "$_name-$pkgver"
    # This currently requires maturin==0.14.2, while the latest packaged is 0.14.4.
    # So until this is made more flexible, let it install it in a virtualenv.
    # python -m build --wheel --no-isolation
    python -m build --wheel
}


package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
