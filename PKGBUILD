# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-undetected-chromedriver
_name=${pkgname#python-}
pkgver=3.5.1
_commit_hash=8049384e5a67277419cc75ae2a19eb67c0e46038
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
sha256sums=('7e559f2e434634aea94db3b17ed31848ae75d2cc93149dfe9b6a755ab9c05664')

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
