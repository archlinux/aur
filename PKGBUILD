# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Florian Pritz <flo@xinu.at>

pkgname=glew1.10
pkgver=1.10.0
pkgrel=3
pkgdesc='A cross-platform C/C++ extension loading library'
arch=('x86_64')
url='http://glew.sourceforge.net'
license=('BSD' 'MIT' 'GPL')
depends=('glibc' 'libgl' 'libx11' 'libxext' 'libxi' 'libxmu')
source=("https://downloads.sourceforge.net/glew/glew-${pkgver}.tgz")
sha256sums=('99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307')

prepare() {
  cd glew-${pkgver}

  sed -i 's|lib64|lib|' config/Makefile.linux
}

build() {
  cd glew-${pkgver}

  make
}

package() {
  cd glew-${pkgver}

  make GLEW_DEST="${pkgdir}/usr" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{libGLEW.{a,so},pkgconfig}}

  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/glew1.10/
}

# vim: ts=2 sw=2 et:
