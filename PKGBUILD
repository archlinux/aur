# Maintainer: envolution
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pkutils
_pkgname=pkutils
pkgver=3.0.2
pkgrel=1
pkgdesc="A python packaging utility library"
arch=(any)
url='https://github.com/reubano/pkutils'
license=(MIT)
depends=('python' 'python-semver')
makedepends=(python-build python-installer python-wheel)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/reubano/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('778360902428b3335b187d7e273e8bcfef900c34aeb864883373cc1aea5a0275')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
