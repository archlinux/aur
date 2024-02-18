# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-undetected-chromedriver
_pkgname=${pkgname#python-}
pkgver=3.5.5
_commit=0aa5fbe252370b4cb2b95526add445392cad27ba
pkgrel=1
pkgdesc="Custom Selenium Chromedriver that passes all bot mitigation systems"
arch=(any)
url="https://github.com/ultrafunkamsterdam/undetected-chromedriver"
license=(GPL-3.0-only)
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('4b5263b42c146553443dced3fb76853b681ba063fd5efa3d2851903f99bb4468')

_archive="$_pkgname-$_commit"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
