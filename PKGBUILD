# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>
		
pkgname=delaycut-git
pkgver=1.4.3.7
pkgrel=2
pkgdesc="Delaycut corrects delay and is also able to cut audio files coded ac3, dts, mpa and wav. It's also able to fix CRC errors in ac3 and mpa files."
arch=('i686' 'x86_64')
#url='http://download.videohelp.com/jsoto/audiotools.htm'
url='https://github.com/darealshinji/delaycut'
license=GPL3
depends=('qt4')
conflicts=('delaycut')
provides=('delaycut')
source=(https://github.com/darealshinji/delaycut/archive/master.zip)
md5sums=(99460ff4ef3679cafe8980d2c41febca)
#source=(http://kfgz.mydevil.net/delaycut-${pkgver}.7z)
#md5sums=(c928eadac0f210d3966d23455cfc7673)

build() {
  cd "${srcdir}"/delaycut-master
  qmake-qt4 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS \
   $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" CONFIG+=Linux delaycut.pro
  make
}

package () {
  cd "${srcdir}"/delaycut-master
  install -Dm755 delaycut "${pkgdir}"/usr/bin/delaycut
  install -Dm644 extra/delaycut.desktop "${pkgdir}"/usr/share/applications/delaycut.desktop
  install -Dm644 extra/delaycut.xpm "${pkgdir}"/usr/share/pixmaps/delaycut.xpm  
}