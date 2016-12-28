# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>
		
pkgname=delaycut
pkgver=1.4.3.8
pkgrel=2
pkgdesc="Corrects delay, cuts audio files coded in ac3, dts, mpa and wav, fixes CRC errors in ac3 and mpa files."
arch=('i686' 'x86_64')
url='https://github.com/darealshinji/delaycut'
license=(GPL3)
depends=('qt5-base')
provides=('delaycut')
source=(https://github.com/darealshinji/delaycut/archive/v1.4.3.8.tar.gz)
sha256sums=('692b28d4a3031d89bacae2f38cf5bfffe84bac7585d29772d75c2fa1f4e02af5')

build() {
  cd "${srcdir}"/delaycut-${pkgver}
  qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS \
   $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" CONFIG+=Linux delaycut.pro
  make
}

package () {
  cd "${srcdir}"/delaycut-${pkgver}
  install -Dm755 delaycut "${pkgdir}"/usr/bin/delaycut
  install -Dm644 extra/delaycut.desktop "${pkgdir}"/usr/share/applications/delaycut.desktop
  install -Dm644 extra/delaycut.xpm "${pkgdir}"/usr/share/pixmaps/delaycut.xpm  
}
