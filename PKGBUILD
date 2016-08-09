# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>
		
pkgname=delaycut-git
pkgver=1.4.3.8
pkgrel=1
pkgdesc="Delaycut corrects delay and is also able to cut audio files coded ac3, dts, mpa and wav. It's also able to fix CRC errors in ac3 and mpa files."
arch=('i686' 'x86_64')
url='https://github.com/darealshinji/delaycut'
license=(GPL3)
depends=('qt5-base')
conflicts=('delaycut')
provides=('delaycut')
source=(https://github.com/darealshinji/delaycut/archive/master.zip)
sha256sums=('41446223ee2f4d13eb309fd99fa90adb91a5478bdf9164ddb407a4ea1467a0ff')

build() {
  cd "${srcdir}"/delaycut-master
  qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS \
   $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" CONFIG+=Linux delaycut.pro
  make
}

package () {
  cd "${srcdir}"/delaycut-master
  install -Dm755 delaycut "${pkgdir}"/usr/bin/delaycut
  install -Dm644 extra/delaycut.desktop "${pkgdir}"/usr/share/applications/delaycut.desktop
  install -Dm644 extra/delaycut.xpm "${pkgdir}"/usr/share/pixmaps/delaycut.xpm  
}
