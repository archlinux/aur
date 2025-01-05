# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=python-gspread
_pkgname=gspread
pkgver=6.1.4
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

_check() {
  cd "$srcdir/$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pkgname-$pkgver-py3-none-any.whl"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('babe83c0cfdfe1a57b484d22a6abed2f1b603657513243234fccdc7dd3191bd58f730111e0c645a8d37ff927923e4da8e3167cc99ee0952d909eb80c25c20db8')
