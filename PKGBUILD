# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=svgelements
pkgname=python-$_name
pkgver=1.8.3
pkgrel=1
pkgdesc='Svg Elements Parsing'
arch=(any)
url='https://github.com/meerk40t/svgelements'
license=('MIT')
depends=(python)
optdepends=('python-numpy: enable npoint() to do lightning fast linearization for Shapes'
            'python-pillow: load images with PIL/Pillow'
            'python-scipy: quickly provide the exact correct answer for the arc length')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-scipy)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('6101a7b5a850847acacf20945a009075ae9c0719bc6e5775ae3de3f1c4f4011fe21d52101f43090255eefbee21807f436b8d6ce63323e1ed7f8c5a0f1e181bb4')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    python -m unittest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
