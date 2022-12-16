# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=svgelements
pkgname=python-$_name
pkgver=1.9.0
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
b2sums=('6bc972ead10757c6b7945583c7bf7aae5d6cca0820425627a4f6e0050240a87afa26591f4d3cc60794e04af6386442b13d2bf8c1615d875531d7f8c6567eff43')

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
