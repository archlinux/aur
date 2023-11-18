# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-undetected-chromedriver
_name=${pkgname#python-}
pkgver=3.5.4
_commit_hash=783b8393157b578e19e85b04d300fe06efeef653
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
sha256sums=('ffb82373949da330ca881b59c059a343f44304e7a59e9596e0b81e9c321259a4')

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
