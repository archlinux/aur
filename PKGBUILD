# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-pandas_market_calendars-git
_pkgname=pandas_market_calendars-git
pkgver=r878.aa77dfa
pkgrel=1
pkgdesc="Market and exchange trading calendars for pandas"
arch=('any')
depends=('python-pytz' 'python-pandas' 'python-exchange_calendars' 'python-dateutil' 'python')
makedepends=( 'git' 'python-setuptools' 'python-build' 'python-installer')
url="https://github.com/rsheftel/pandas_market_calendars"
license=('MIT')
provides=('python-pandas_market_calendars')
conflicts=('python-pandas_market_calendars')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}



build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
