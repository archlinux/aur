# Maintainer: Philipp Joram <phijor AT t-online DOT de>

_appname=fx9860g-screenstreamer
pkgname=${_appname}-qt5
pkgver=25
pkgrel=1
pkgdesc="A tool to display the screen of a connected Casio fx-9860g-family calculator"
arch=('x86_64')
url="http://sourceforge.net/p/fxsdk/code/HEAD/tree/screenstreamer/trunk/"
license=('GPL3')
depends=('qt5-base' 'libusb' 'gcc-libs')
makedepends=('subversion')

source=('svn://svn.code.sf.net/p/fxsdk/code/')
md5sums=('SKIP')

build() {
  cd "${srcdir}/code/screenstreamer/trunk/"

  msg "Patching Makefiles..."
  cp screenstreamer.pro tmp
  sed '/^TARGET/ c TARGET=screenstreamer' tmp |\
    sed '22 i QT += widgets' > screenstreamer.pro

  msg "Building application..."
  qmake-qt5 -o Makefile screenstreamer.pro
  make
}

package() {
  cd "${srcdir}/code/screenstreamer/trunk/"
  install -m 755 -D screenstreamer "${pkgdir}/usr/bin/${_appname}"
}

# vim:set ts=2 sw=2 et:
