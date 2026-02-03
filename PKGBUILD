#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=3.1.0
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1e9ddc427dd967c766870fc6b7ad11c62fe73a25e007e6b826a827efeceaa3e5')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

build() {
  cd "$pkgname-$pkgver" || exit
  rm -vf LICENSE
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}
