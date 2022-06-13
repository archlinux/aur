# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.13.46
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
sha512sums=("bab98c6a08dffbd18747787efcbb3d9f28f23c7d1500f2869826f777d440efb1eac9e6a177c67e63a21930c6082d5fd168e140ebb0e2ed9e4ddf026fb28a31ce")

build() {
    cd $_name-$pkgver
    rm ../wheels -rf
    maturin build -o ../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
