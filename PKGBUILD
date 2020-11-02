# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Maintainer: SanskritFritz (gmail)

pkgname=oolite
pkgver=1.90
pkgrel=3
pkgdesc="A space-sim based on the classic Elite"
arch=('x86_64')
url="http://www.oolite.org/"
license=('GPL2')
depends=('espeak' 'gnustep-base' 'sdl_mixer' 'sdl_image' 'glu' 'nspr' 'openal')
makedepends=('gnustep-make' 'curl' 'zip' 'mesa' 'gcc-objc')
source=("oolite" "https://github.com/OoliteProject/oolite/releases/download/$pkgver/oolite-source-$pkgver.tar.bz2")
md5sums=('ade14e17fe9d52d16b35f2e97046362c'
         'c34c6f88606be75c90cc52c5a4173611')

prepare() {
  cd "oolite-source-$pkgver"

  # Workaround for missing textures and fonts (thanks Lone_Wolf)
  # http://aegidian.org/bb/viewtopic.php?f=9&t=20754
  rm deps/Linux-deps/include/png.h
  rm deps/Linux-deps/include/pngconf.h
}

build() {
  cd "oolite-source-$pkgver"
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release
}

package() {
  cd "oolite-source-$pkgver"

  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{oolite,applications,pixmaps,doc/oolite}

  cp -r oolite.app/* ${pkgdir}/usr/share/oolite/

  install -D -m755 ../oolite ${pkgdir}/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png ${pkgdir}/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop ${pkgdir}/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf ${pkgdir}/usr/share/doc/oolite/
}
# vim:set ts=2 sw=2 et:
