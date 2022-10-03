# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.14.17
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
b2sums=("d6c9592f6c325c8aacdb192891a199916885702e2a03e5540b2600a81d888d398e80b744968382a6af9bc3354c735b611a895f9508bf06ce104ef78060e4fe95")

build() {
    rm wheels -rf
    cd polars-py-v$pkgver/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-py-v$pkgver/LICENSE
}
