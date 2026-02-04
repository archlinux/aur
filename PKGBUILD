#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=nextmeeting
pkgver=3.1.1
pkgrel=1
pkgdesc="An utility tool to show you next meeting with gcalcli"
arch=('any')
url="https://github.com/chmouel/nextmeeting"
license=('Apache')
depends=('python-dateutil' 'gcalcli')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a6281a9a1c36c926a9b33c82fe4d2e5573cc700505207c4d7f0003ee61c7901')
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
