# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: sonic414 <kevinjf at live dot in>
		
pkgname=delaycut
pkgver=1.4.3.9
pkgrel=1
pkgdesc="Corrects delay, cuts audio files coded in ac3, dts, mpa and wav, fixes CRC errors in ac3 and mpa files."
arch=('i686' 'x86_64')
url='https://github.com/darealshinji/delaycut'
license=(GPL3)
depends=('qt5-base')
provides=('delaycut')
source=("${pkgname}-${pkgver}::https://github.com/darealshinji/delaycut/archive/v${pkgver}.tar.gz")
sha256sums=('3e215c906efc9680a7254b250f9c2fbd9f3f0a5f8b56481f2268b30c03c715e4')

build() {
  cd "${srcdir}"/delaycut-${pkgver}
  qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS \
   $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" CONFIG+=Linux delaycut.pro
  make
}

package () {
  cd "${srcdir}"/delaycut-${pkgver}
  install -Dm755 delaycut "${pkgdir}"/usr/bin/delaycut
  install -Dm644 misc/delaycut.desktop "${pkgdir}"/usr/share/applications/delaycut.desktop
  install -Dm644 src/icon.png "${pkgdir}"/usr/share/pixmaps/delaycut.png  
}
