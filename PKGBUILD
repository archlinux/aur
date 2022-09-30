# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.14.15
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
depends=('python' 'python-numpy')
optdepends=('python-pandas: for interoperability with pandas frames'
            'python-pyarrow: for interoperability with arrow types'
            'python-pytz: to enable conversion to python datetimes with timezones'
            'python-fsspec: to transparently open files locally or remotely')
makedepends=('maturin' 'rust-nightly' 'cmake' 'python-installer')
_name=${pkgname#python-}
source=("https://github.com/pola-rs/polars/archive/refs/tags/py-polars-v$pkgver.tar.gz")
b2sums=("3c14bc29b6aade4c9392e3d413cfaf3812c4ca52635f9c35c676500424c3b519890670f566d4a53c9fae8eb0f3de951a01439bb7696e54384c97af2cf5f4d485")

build() {
    rm wheels -rf
    cd polars-py-polars-v$pkgver/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-py-polars-v$pkgver/LICENSE
}
