# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.14.5
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
b2sums=("8e48fff1c535edabbbd3fa1ec722098b6e47df62863e525af9abe48cb9c063e317c478e5eb640b7b16055b3e4d7ce608b39bfd33fc869389f2ebbcb6ec995aed")

build() {
    rm wheels -rf
    cd polars-py-polars-v$pkgver/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-py-polars-v$pkgver/LICENSE
}
