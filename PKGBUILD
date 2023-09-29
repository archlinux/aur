# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-geotorch
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Constrained optimization toolkit for PyTorch'
arch=('any')
url='https://github.com/lezcano/geotorch'
license=('Apache')
groups=()
depends=('python-pytorch')
makedepends=('python-build' 'python-installer')
checkdepends=('python-pytest')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/lezcano/$_pkgname/archive/refs/tags/$pkgver.tar.gz"
        'python-geotorch.diff')
sha256sums=('dc10a22ee09dec15fe86fe4cae7806da4246704a5e4dab9319a866c62350cc56'
            '2663419a83c8de6f4383f31faefbfe3a045f339ff0edfbe28b6c190c863ddb6d')

prepare() {
    cd $_pkgname-$pkgver
    patch -p1 -i ../python-geotorch.diff
}

build() {
    python -m build -nw "$_pkgname-$pkgver"
}

check() {
    cd $_pkgname-$pkgver
    PYTHONPATH=$(pwd) pytest test
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
