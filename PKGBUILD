#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=3.0.0
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c0dc02f24c7e395ab5bf0d9dd6a1879b813d740d062155e5d0cec9dee94ad86c')
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
