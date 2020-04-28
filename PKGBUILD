# Contributor: Army
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: aksr <aksr at t-com dot me>

pkgname=sandy-git
pkgver=0.6.r166.50204e1
pkgrel=1
pkgdesc="An ncurses text editor with an easy-to-read, hackable C source."
arch=('i686' 'x86_64')
url="https://github.com/japanoise/sandy.git"
license=('custom:MIT/X')
depends=('ncurses')
makedepends=('git')
provides=('sandy')
conflicts=('sandy')
source=("git+$url")
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s.%s" "$(awk '/VERSION =/ {print $3}' config.mk)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}

  if [ -e "$srcdir"/config.h ];
  then
    msg "use custom config.h"
    cp "$srcdir"/config.h .
  else msg "use default config.h"
  fi
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-git}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

