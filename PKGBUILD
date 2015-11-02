# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>
pkgname=('qtel')
_pkgname=('svxlink')
pkgver="14.08.2"
pkgrel=1
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
source=("https://github.com/sm0svx/${_pkgname}/archive/${pkgver}.tar.gz")
conflicts=("svxlink")
sha256sums=('fe420a035cce6a293b1e46dcba98e79a089548bb5d9329a9f79f0e51054f8ce2')
depends=('alsa-utils' 'alsa-lib' 'libsigc++' 'gsm' 'libgcrypt' 'popt' 'tcl' 'speex' 'opus')
makedepends=('cmake')
pkgdesc="Graphical Userinteface for Echolink written in QT"

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var ..
  make
  make doc
}

package(){
  make -C ${srcdir}/${_pkgname}-${pkgver}/src/build DESTDIR="${pkgdir}" install
  rm ${pkgdir}/usr/bin/{remotetrx,siglevdetcal,svxlink}
  rm -r ${pkgdir}/usr/include
  rm ${pkgdir}/usr/lib/libasynccpp.so*
  rm -r ${pkgdir}/usr/lib/svxlink 
  rm -rf ${pkgdir}/usr/share/{doc,man,svxlink}
  rm -r ${pkgdir}/var
  rm -r ${pkgdir}/etc
}
