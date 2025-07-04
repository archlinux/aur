# Maintainer: futpib <futpib@gmail.com>

pkgname=python-backtrader-git
_pkgname=backtrader
pkgver=1.9.74.123.r55.gb853d7c9
pkgrel=1
pkgdesc="Python Backtesting library for trading strategies"
arch=('any')
url="https://github.com/mementum/backtrader"
license=('GPL3')
depends=('python')
optdepends=(
  'python-matplotlib: for plotting support'
  'python-pytz: for timezone support'
  'python-ta-lib: for technical analysis indicators'
)
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=("python-backtrader")
conflicts=("python-backtrader")
source=("${_pkgname}::git+https://github.com/mementum/backtrader.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
