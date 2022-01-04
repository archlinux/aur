# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scroll-git
pkgver=0.1.r2.g51ee387
pkgrel=2
pkgdesc='A scrollback buffer for a terminals like st'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(libxft)
makedepends=('ncurses' 'libxext' 'git')
provides=('scroll')
conflicts=('scroll')
url=https://git.suckless.org/scroll/file/README.html
source=(git://git.suckless.org/scroll)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}	
  make $_makeopts X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd ${pkgname%-git}
  local installopts='--mode 0644 -D --target-directory'
  local shrdir="$pkgdir/usr/share"
  local licdir="$shrdir/licenses/$pkgname"
  local docdir="$shrdir/doc/$pkgname"
  make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
  install $installopts "$licdir" LICENSE
  install $installopts "$docdir" README
}
