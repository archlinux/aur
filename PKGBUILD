# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=6.0.1
pkgrel=2
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

sha512sums=('2e2359b16d68823ae297584595c94e415a6e2e5c0e0a7ec3200fe5e33fa08c8124cce55c34e2e098c9b72663c3ddcd9d71bbf99c683fc464a50a539b0f300ccf')
