# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-undetected-chromedriver
_name=${pkgname#python-}
pkgver=3.5.0
_commit_hash=2b035b4ea1d88224abd570b187f16094663462a3
pkgrel=2
pkgdesc="Custom Selenium Chromedriver that passes all bot mitigation systems"
arch=(any)
url="https://github.com/ultrafunkamsterdam/undetected-chromedriver"
license=(GPL3)
depends=(
  python
  python-requests
  python-selenium
  python-websockets
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit_hash.tar.gz")
sha256sums=('4db117ffa73787d9eba598ac5270bf9d03e5ba1824e0cf06325324ddf4455982')

_archive="$_name-$_commit_hash"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
