# Contributor: Army
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: aksr <aksr at t-com dot me>

pkgname=sandy-git
pkgver=0.5r4.6dcd566
pkgrel=1
pkgdesc="An ncurses text editor with an easy-to-read, hackable C source."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/sandy"
license=('custom:MIT/X')
depends=('ncurses')
makedepends=('git')
provides=('sandy' 'sandy-hg')
conflicts=('sandy' 'sandy-hg')
source=("$pkgname::git+http://github.com/antics/sandy.git")
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%sr%s.%s" "$(awk '/VERSION =/ {print $3}' config.mk)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname

  if [ -e "$srcdir"/config.h ];
  then
    msg "use custom config.h"
    cp $startdir/config.h .
  else msg "use default config.h"
  fi
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

