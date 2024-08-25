# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=6.1.2
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('Custom:MIT')
depends=('python-google-auth' 'python-google-auth-oauthlib' 'python-strenum')
checkdepends=('python-pytest-asyncio' 'python-pytest-vcr')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-wheel')
source=("https://github.com/burnash/$_pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pkgname-$pkgver-py3-none-any.whl"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('7e6c8f05c25c008b823051c2164849ae428cdf3310da7b50c9ad1a089d04ed6f8de75a6bcd20ea6767a81b2b20b36bfcb0291ec79ec72149548e514623dddb68')
