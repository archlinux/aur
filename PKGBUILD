# Maintainer: <mumei AT airmail DOT cc>

pkgname=gomoku.app
_pkgname=Gomoku
pkgrel=1
pkgver=1.2.9
pkgdesc="Extended TicTacToe game for GNUstep"
arch=('i686' 'x86_64')
url="https://github.com/gomoku/Gomoku.app-GNUstep"
license=('GPL')
groups=('gnustep-games')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://www.gnustep.it/nicola/Applications/Gomoku/Gomoku-1.2.9.tar.gz")
sha256sums=('1d3680559747deb7fbf35dc67d08e99e979961f146676cca1259a7e25185c5a2')

prepare(){
# Fix Icon
  cd $_pkgname-$pkgver
  icon='  NSIcon = "Gomoku.png";'
  sed -i "9s@^.*@$icon@;s/.app//" GomokuInfo.plist
}

build() {
  cd $_pkgname-$pkgver
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
