# Maintainer: Tom Swartz <tom@tswartz.net>

pkgname=dump1090-tomswartz-git
_gitname=dump1090
pkgver=0.r402.b34d8e0
pkgrel=1
pkgdesc="Dump1090 mode S decoder for RTL-SDR devices. Git based tomswartz07 forked version"
arch=('i686' 'x86_64')
url="https://github.com/tomswartz07/dump1090"
license=('BSD')
install=dump1090.install
depends=('rtl-sdr')
provides=('dump1090')
conflicts=('dump1090-git' 'dump1090-fa-git' 'dump1090-mutability-git')
makedepends=('git')
source=('git://github.com/tomswartz07/dump1090.git')
md5sums=('SKIP')
 
pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr/
}
 
package() {
  install -Dm755 "$srcdir/$_gitname/dump1090" "$pkgdir/usr/bin/dump1090"
  install -Dm755 "$srcdir/$_gitname/view1090" "$pkgdir/usr/bin/view1090"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/$_gitname/public_html/" "$pkgdir/usr/share/$_gitname/"
}
