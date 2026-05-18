# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=autocrop
pkgname=python-${_pkgname}-git
pkgver=20260517.r6.d5b7b7f
pkgrel=1
pkgdesc='Automatically crop and rotate scanned images using OpenCV'
arch=('any')
url='https://github.com/z80z80z80/autocrop'
license=('GPL3')
depends=('python-opencv' 'python-numpy')
makedepends=('git' 'dos2unix')
source=('git+https://github.com/z80z80z80/autocrop#branch=main')
sha512sums=('SKIP')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci main | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  dos2unix ${_pkgname}.py
  sed -i '1s|^|#!/usr/bin/env python\n\n|' ${_pkgname}.py
}

package() {
  cd $_pkgname
  install -Dm755 ${_pkgname}.py "$pkgdir/usr/bin/${_pkgname}"
}
