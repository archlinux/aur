# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=osgg
pkgver=1.0
pkgrel=3
pkgdesc="a 2D game inspired by lunar lander with sweet 70's style vector graphics"
url="http://osgg.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('sdl_image' 'gcc-libs' 'sdl_ttf' 'libgl' 'sdl_mixer')
source=(
  ${pkgname}-${pkgver}.tar.xz::"https://master.dl.sourceforge.net/project/osgg/osgg/1.0/Osgg-version_1.0-build_0053_src.tar.xz" 
  "osgg.desktop"
)
md5sums=(
  'c0552b8a8dc12e2cefa11447ae43f989' 
  'bc8c813dbc1ac6605e691ab9cbb52f84'
)
_srcdir="osgg_build_0053_src"

build() {
  cd ${srcdir}/${_srcdir}
  make clean
  make
}

package() {
  cd ${srcdir}/${_srcdir}
  mkdir -p ${pkgdir}/usr/{share/osgg/levels,bin}
  install -D -m755 osgg ${pkgdir}/usr/share/osgg/osgg
  install -D -m644 *.txt ${pkgdir}/usr/share/osgg/
  install -D -m644 *.ogg ${pkgdir}/usr/share/osgg/
  install -D -m644 Bandal.ttf ${pkgdir}/usr/share/osgg/Bandal.ttf
  install -D -m644 levels/* ${pkgdir}/usr/share/osgg/levels
  echo "#!/bin/sh
  cd /usr/share/osgg
  ./osgg \"\$@\"" > ${pkgdir}/usr/bin/osgg
  chmod 755 ${pkgdir}/usr/bin/osgg
  install -D -m644 launcher/icon.png ${pkgdir}/usr/share/pixmaps/osgg.png
  install -D -m644 ${srcdir}/osgg.desktop ${pkgdir}/usr/share/applications/osgg.desktop
}
