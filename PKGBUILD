# $Id$
# Mantainer: Eduardo escobar <eduardoeae@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=stellarium-lts
_pkgname=stellarium
pkgver=0.12.9
pkgrel=2
pkgdesc="A stellarium with great graphics and a nice database of sky-objects. LTS version for old/weak graphics cards"
arch=("i686" "x86_64")
url="http://stellarium.org/"
license=('GPL2')
depends=('libpng' 'glu' 'libgl' 'freetype2' 'qt4' 'openssl' 'desktop-file-utils' 'xdg-utils')
provides=("stellarium")
conflicts=("stellarium")
install=stellarium.install
makedepends=('cmake' 'boost' 'mesa' 'mesa-libgl')
source=(https://github.com/Stellarium/stellarium/releases/download/v${pkgver}/stellarium-${pkgver}.tar.gz
	stellarium.desktop
        stellarium.png)
md5sums=('ed95879c38e7370ed895df47ef7b1aac'
         'b4f9ebd082c4e112c2bbfac9f2c8465d'
         '134ab08e73f4f5d995a7931a7957b7a3')
	
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # Fix for build fail
  CFLAGS="$CFLAGS -fpermissive"
  CXXFLAGS="$CXXFLAGS -fpermissive"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
 
  make DESTDIR=${pkgdir} install

  # install desktop file & pixmap
  install -Dm644 ${srcdir}/stellarium.desktop \
	${pkgdir}/usr/share/applications/stellarium.desktop
  install -Dm644 ${srcdir}/stellarium.png \
	${pkgdir}/usr/share/pixmaps/stellarium.png
}
