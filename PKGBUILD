# Maintainer: Abigail G <dev@kb6.ee>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>

pkgname=qtel
_pkgname=svxlink
pkgver=19.09.1
pkgrel=2
arch=('x86_64')
url="http://www.github.com/sm0svx/svxlink/"
license=('GPL')
source=("https://github.com/sm0svx/${_pkgname}/archive/${pkgver}.tar.gz")
conflicts=("svxlink")
sha256sums=('5e5cbc3501fa6c6ec68334f8217ef93f5dc879d4d0e41e6f71378fd67d69f6a2')
depends=('alsa-utils' 'alsa-lib' 'libsigc++' 'gsm' 'libgcrypt' 'popt' 'tcl' 'speex' 'opus' 'qt5-tools')
makedepends=('cmake')
pkgdesc="Graphical Userinteface for Echolink written in QT"

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLOCAL_STATE_DIR=/var -DUSE_QT=YES -DSBIN_INSTALL_DIR=/usr/bin ..
  make
  make doc
}

package(){
  make -C ${srcdir}/${_pkgname}-${pkgver}/src/build DESTDIR="${pkgdir}" install
  rm ${pkgdir}/usr/bin/{remotetrx,siglevdetcal,svx*,devcal}
  rm -rf ${pkgdir}/usr/include
  rm -f ${pkgdir}/usr/lib/libasynccpp.so*
  rm -rf ${pkgdir}/usr/lib/svxlink
  rm -rf ${pkgdir}/usr/share/doc/{svxlink,echolib}
  rm -rf ${pkgdir}/usr/share/svxlink
  rm -r ${pkgdir}/var
  rm -r ${pkgdir}/etc
}
