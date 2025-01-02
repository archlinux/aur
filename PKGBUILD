#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=1.5.5
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('35c49c8ab5887d622691facef43e5ec791cb7ac3e576ad83a6d4f2c7b97e8c81')
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
