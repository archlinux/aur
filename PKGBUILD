# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-transforms3d
pkgdesc="3 dimensional spatial transformations for Python"
pkgver=0.4.1
pkgrel=1
url="https://matthew-brett.github.io/transforms3d/"
arch=('any')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-scipy' 'python-sympy')
optdepends=(
  'python-sympy: to run the algebraic derivations of some algorithms'
)
license=('BSD')
source=(
  "transforms3d-$pkgver.tar.gz::https://github.com/matthew-brett/transforms3d/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '87626eed57297082e6a8e4e885eb2a62265423b3072e46486609cccfaacbe4b7'
)

build() {
  cd "transforms3d-${pkgver}"
  python -m build --no-isolation --wheel
}

check() {
  cd "transforms3d-${pkgver}"
  pytest -v
}

package() {
  cd "transforms3d-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
