# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.13.57
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("8cb2d7cec0c21cc593565b981c6a63515061fdbcba84752e3422cace9ff40bbbbc9a491cb1b0494546c34a21e2155f45b16590488a92db7cb51639d7eaebfe38")

build() {
    cd $_name-$pkgver
    rm ../wheels -rf
    maturin build -o ../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
