# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Florian Pritz <flo@xinu.at>

pkgname=lib32-glew1.10
pkgver=1.10.0
pkgrel=4
pkgdesc='A cross-platform C/C++ extension loading library'
arch=(x86_64)
url=http://glew.sourceforge.net
license=(
  BSD
  MIT
  GPL
)
depends=(
  lib32-glibc
  lib32-libgl
  lib32-libx11
  lib32-libxext
  lib32-libxi
  lib32-libxmu
)
makedepends=(git)
source=(https://downloads.sourceforge.net/glew/glew-${pkgver}.tgz)
sha256sums=(99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307)

prepare() {
  cd glew-${pkgver}

  sed -i 's|CC = cc|CC = gcc -m32|' config/Makefile.linux
  sed -i 's|LD = cc|LD = gcc -m32|' config/Makefile.linux
  sed -i 's|lib64|lib32|' config/Makefile.linux
}

build() {
  cd glew-${pkgver}

  make lib
}

package() {
  cd glew-${pkgver}

  make GLEW_DEST="${pkgdir}"/usr install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{libGLEW.{a,so},pkgconfig}}
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/lib32-glew1.10/
}

# vim: ts=2 sw=2 et:
