# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.14.6
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
b2sums=("cda0d96fbe25eba84aa4f652331aac049015d43c6cbcdc419e391a947c0b8b2563d2d547065c70d7a52af5213056639978e24b81f6f3c92f0bdefe986b4cfbba")

build() {
    rm wheels -rf
    cd polars-py-polars-v$pkgver/py-polars
    maturin build -o ../../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" polars-py-polars-v$pkgver/LICENSE
}
