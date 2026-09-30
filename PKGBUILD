# Maintainer: a821 at mail de
# Contributor: Nicolas Bizzozzéro <nicolas.bizzozzero@protonmail.com>

pkgname=python-river-git
pkgver=0.26.1.r22.g03b4818208
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
  git
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
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/online-ml/river")
sha256sums=('SKIP')

pkgver() {
  cd river
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd river
  python -m build --wheel --no-isolation
}

package() {
  cd river
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=2 sw=2 et:
