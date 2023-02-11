# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pybrowsers
_name=browsers
pkgver=0.5.2
pkgrel=1
pkgdesc="Python library for detecting and launching browsers"
arch=(any)
url="https://github.com/roniemartinez/browsers"
license=(MIT)
makedepends=(python-{build,installer,wheel,poetry})
depends=(python-pyxdg)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9e7c0127d28b2b4a32810fcdcd6085db265361893dd443de54b5ec92da116e71')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  # Due to a bug in poetry when there is a nesting of git directories
  # See https://github.com/pypa/build/issues/384 for more info
  GIT_CEILING_DIRECTORIES="$PWD/.." python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
