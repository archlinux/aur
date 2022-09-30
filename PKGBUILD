# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=svgelements
pkgname=python-$_name
pkgver=1.8.4
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
b2sums=('e59e940370f494805f272085a40f085b0b3a83e847f5e8bf43f23083a4e187e9c8adc2c7e4728a1a8a9f62502de36f76c307f3a2552fa31a1d35a32d17dd2179')

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
