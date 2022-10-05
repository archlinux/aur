# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.14.18
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
source=("https://github.com/pola-rs/polars/archive/refs/tags/py-v$pkgver.tar.gz")
b2sums=("781e1436b1ecad1574ee11ddc7b58dc3d7a6e7dd8655121018e28f0ab1661141aaf663e1abc5c741ef4cec4b5db520ca4ad097aa5aa85f6df7342f7ca9754741")

build() {
    rm wheels -rf
    cd polars-py-v$pkgver/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-py-v$pkgver/LICENSE
}
