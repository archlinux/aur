# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=python-polars
pkgver=0.13.41
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("a8eb0a6a24ba99f5de7922941e8d2a93b378fcc27e2e22bcd8178408faaedd8252d96a3d174e301e56aac58e8900f3caa714b2f3a7c90aa75422ec11387b1ac6")
makedepends=('maturin' 'rust-nightly')

build() {
    cd $_name-$pkgver
    maturin build
}

package() {
    python -m installer -d "$pkgdir" $_name-$pkgver/target/wheels/*.whl
    # TODO: Find a license somewhere?
    # install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name-$pkgver/LICENSE
}
