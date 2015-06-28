# Contributor: Army
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=sandy-git
pkgver=0.4.r109.gb6e956c
pkgrel=2
pkgdesc="An ncurses text editor with an easy-to-read, hackable C source."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/sandy"
license=('custom:MIT/X')
depends=('ncurses')
makedepends=('git')
provides=('sandy' 'sandy-hg')
conflicts=('sandy' 'sandy-hg')
source=("$pkgname::git+http://git.suckless.org/sandy")
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  if [ -e $startdir/config.h ];
  then
    msg "use custom config.h"
    cp $startdir/config.h .
  else msg "use default config.h"
  fi
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

