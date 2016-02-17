# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>
pkgname=('qtel')
_pkgname=('svxlink')
pkgver="15.11"
pkgrel=2
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
source=("https://github.com/sm0svx/${_pkgname}/archive/${pkgver}.tar.gz")
conflicts=("svxlink")
sha256sums=('17bd8a1174c70e990b676210e6edb373732d284aed55c5a82bc378a1d69cecf2')
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
  rm -rf ${pkgdir}/usr/include
  rm -f ${pkgdir}/usr/lib/libasynccpp.so*
  rm -f ${pkgdir}/usr/lib64/libasynccpp.so*
  rm -rf ${pkgdir}/usr/lib/svxlink 
  rm -rf ${pkgdir}/usr/lib64/svxlink 
  rm -rf ${pkgdir}/usr/share/{doc,man,svxlink}
  rm -r ${pkgdir}/var
  rm -r ${pkgdir}/etc
  mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
}
