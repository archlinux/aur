# Maintainer: Tomas Svoboda <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=5.2
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
license=("PSF")
arch=("any")
url="https://github.com/zopefoundation/roman"
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('96c63e63f2cd66c6c1d20c6d5f9e61072b73ae4f405f73bf3f31198ed38c3415')


build() {
  cd "roman-$pkgver"
  python -m build --skip-dependency-check --wheel --no-isolation
}

check() {
  cd "roman-$pkgver/src"
  python -m unittest tests.py
}

package() {
  cd "roman-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

