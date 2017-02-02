# Maintainer: Seriel <jack@seriel.pw>

pkgname=urxvtconfig
pkgver=1.5.47d7f67
pkgrel=1
pkgdesc='A graphical user interface tool for configuration of the rxvt-unicode terminal emulator.'
arch=('x86_64')
url="https://github.com/daedreth/URXVTConfig"
license=('LGPL-3.0')
depends=('git' 'qt4' 'fontconfig' 'libxft' 'libxcb' 'freetype2')
optdepends=('imagemagick: Needed to get colours from a file.')
makedepends=('qt4' 'gcc' 'git')
conflicts=($pkgname)
provides=($pkgname)
source=('urxvtconfig::git+https://github.com/daedreth/URXVTConfig.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

#build() {
#  cd "${srcdir}/${pkgname}"
#  /usr/lib64/qt4/bin/qmake source/URXVTConfig.pro
#  make
#}

package() {
  cd $pkgname
  /usr/lib64/qt4/bin/qmake source/URXVTConfig.pro
  make DESTDIR="${pkgdir}" install
  install -D -m 755 urxvtconfig "$pkgdir/usr/bin/urxvtconfig"
  install -D -m 644 source/urxvtconfig.desktop  "$pkgdir/usr/share/applications/urxvtconfig.desktop"
}
