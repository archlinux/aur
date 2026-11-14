# Maintainer: a821 at mail de
# Contributor: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>

pkgname=python-river
pkgver=0.27.0
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
sha256sums=('62ed8cb95dafdb75545f8e377b99a8b2bed870bd1e5931f632dc833f913af8df')

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
