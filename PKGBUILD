# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-undetected-chromedriver
_name=${pkgname#python-}
pkgver=3.5.3
_commit_hash=a415e40b0b6e260a0b5844dd714c7f358a168ceb
pkgrel=1
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
sha256sums=('ee513a5bb7179fb3eff55aa40ae31e3daaa980e4cd6c9871b888438600e4b50f')

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
