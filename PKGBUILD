# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.13.40
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("8b4fb5a845837253ea75c76698ee04379cb6a52354910a4ec00b330f6c3d87d79722b9a97d5425443077183834e55cba0d521bee191cc697bd052c2179ae0be0")
makedepends=('maturin' 'cargo')

prepare() {
    cd $_name-$pkgver
    sed -i "s/-o wheels/-o ..\/wheels/" Makefile
}

build() {
    cd $_name-$pkgver
    make build-no-venv
}

package() {
    python -m installer -d "$pkgdir" wheels/*.whl
    # install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
