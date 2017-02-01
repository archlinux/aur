# Maintainer: Seriel <jack@seriel.pw>

pkgname=urxvtconfig
pkgver=1.5.r2.gc5f5bfc
pkgrel=1
pkgdesc='A graphical user interface tool for configuration of the rxvt-unicode terminal emulator.'
arch=('x86_64')
url="https://github.com/daedreth/URXVTConfig"
license=('LGPL-3.0')
depends=('git' 'qt4' 'fontconfig' 'libxft' 'imagemagick' 'libxcb' 'freetype2')
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

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -m 755 urxvtconfig "$pkgdir/usr/bin/urxvtconfig"
}
