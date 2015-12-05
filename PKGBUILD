# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Florian Pritz <flo@xinu.at>

pkgname=glew1.10
pkgver=1.10.0
pkgrel=1
pkgdesc='A cross-platform C/C++ extension loading library'
arch=('i686' 'x86_64')
url='http://glew.sourceforge.net'
license=('BSD' 'MIT' 'GPL')
depends=('glu' 'libxi' 'libxmu')
source=("http://downloads.sourceforge.net/glew/glew-${pkgver}.tgz")
sha256sums=('99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307')

prepare() {
  cd glew-${pkgver}

  sed -i 's|lib64|lib|' config/Makefile.linux
  sed -i '/^.PHONY: .*\.pc$/d' Makefile
}

build() {
  cd glew-${pkgver}

  make
}

package() {
  cd glew-${pkgver}

  make GLEW_DEST="${pkgdir}/usr" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{libGLEW.{a,so},pkgconfig}}

  install -dm 755 "${pkgdir}"/usr/share/licenses/glew1.10
  install -m 644 LICENSE.txt "${pkgdir}"/usr/share/licenses/glew1.10/
}
