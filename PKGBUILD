# Maintainer: a821 at mail de
# Contributor: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>

pkgname=python-river
pkgver=0.26.1
pkgrel=1
pkgdesc="Online machine learning in Python"
arch=("x86_64")
url="https://riverml.xyz"
license=('BSD-3-Clause')
depends=(
  python
  python-narwhals
  python-numpy
  python-scikit-learn
  python-scipy
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
)
optdepends=(
  graphviz
  python-pandas
  python-sqlalchemy
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/online-ml/river/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b5a6e618a9eb436307ed801eb75c82699ad542a7c18c050477364e21b48633c2')

build() {
  cd "river-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "river-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=2 sw=2 et:
