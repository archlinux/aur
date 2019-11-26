# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-miflora-git
_pkgname=miflora
pkgver=ebda66d
pkgrel=1
pkgdesc="Library for Xiaomi Mi plant sensor"
url="https://github.com/open-homeautomation/miflora"
arch=("any")
license=("MIT")
depends=("python")
source=("${_pkgname}::git+https://github.com/open-homeautomation/miflora.git")
conflicts=("python-miflora")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --skip-build -O1 --root="${pkgdir}"

  rm -Rf ${pkgdir}/usr/lib/*/site-packages/test/
}

# vim: ts=2 sw=2 et:
