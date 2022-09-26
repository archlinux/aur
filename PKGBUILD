# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=svgelements
pkgname=python-$_name
pkgver=1.8.2
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
b2sums=('6b4ee737dd18b5fd684a6b64d13d30dd89856db7d61358f1e223e30573ce8d95e9b265ab53c31d7af70adc50e2c7883d62781b918e6cef09c6a5bc2aa978c560')

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
