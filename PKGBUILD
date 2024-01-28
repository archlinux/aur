# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=nexfil
pkgver=1.0.6
_commit=326fbacffedaabbd4f009271b53ba0f4223e83d5
pkgrel=2
pkgdesc="OSINT tool for finding profiles by username"
arch=(any)
url="https://github.com/thewhiteh4t/nexfil"
license=(MIT)
depends=(
  python
  python-aiohttp
  python-packaging
  python-requests
  python-selenium
  python-tldextract
  python-undetected-chromedriver
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('508b25876f35b92707ae5b40dba556fda88f5d83ab58b14de6be85389e18fa13')

_archive="$pkgname-$_commit"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
