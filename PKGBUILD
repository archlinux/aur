# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=ttymidi
pkgver=0.60
pkgrel=1
pkgdesc="MIDI for your serial devices"
url="http://www.varal.org/ttymidi"
arch=('i686' 'x86_64' 'armv7h')
license=("gpl")
depends=('alsa-lib')
source=("http://www.varal.org/ttymidi/ttymidi.tar.gz")
sha256sums=('97864fced143cecd038e3dd790d224b52e89f6cf6a461893fb11c325e8458476')

build() {
  cd "$srcdir/${pkgname}"
  sed -i -e '/gcc/s/$/ -pthread/' Makefile
  sed -i -e '/gcc/s/$/ -Wno-implicit-int/' Makefile # to silence warning (bad!)
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 ttymidi $pkgdir/usr/bin/ttymidi
}
