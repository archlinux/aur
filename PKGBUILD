# Maintainer: Tomas Svoboda <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=5.0
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
license=("PSF")
arch=("any")
url="https://github.com/zopefoundation/roman"
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c9068177a84dd6e676dce132f2cf97533e4518d238284c2d9cdc5b8182ac2629')


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

