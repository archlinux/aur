# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=6.2.1
pkgrel=1
pkgdesc="Google Spreadsheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=('MIT')
depends=('python-google-auth' 'python-google-auth-oauthlib')
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

sha512sums=('64d6d6d9ed704730aed41a23f3f82bab34cfc21867ece70343e4d92c36ead99e68c345084334cf9fe62565b0d2922c41a3675beca605c71ceb334ca63ac3abca')
