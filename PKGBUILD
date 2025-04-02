# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=6.2.0
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

sha512sums=('d719d5851cb4b63f1658c433d984c5c2a1cce9a21f1ea76bd8d425693826285c24871baa81e1397df54d3b888ec2bfe4ed6a5328f55dc16fdb6875e7c9afbdee')
