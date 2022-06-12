# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.13.45
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
sha512sums=("6508ecdd766e3431b88c0751c2177a3b936fe8c5c6689282469372858e4e6e5f262a91b5c8899d7ec245eb821e0e40b5e207911ad5ed37b9afb5c81136fae44c")

build() {
    cd $_name-$pkgver
    rm ../wheels -rf
    maturin build -o ../wheels --release
}

package() {
    python -m installer -d "$pkgdir" ./wheels/*.whl
    # TODO: Find a license somewhere?
    # install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
