# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=dwm-baitinq-git
_gitname=dwm
pkgver=1
pkgrel=1
pkgdesc='Simple window manager (baitinq version)'
url='https://github.com/Baitinq/dwm.git'
arch=('any')
license=('GPL')
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
conflicts=('dwm')
provides=('dwm')

# include config.h and any patches you want to have applied here
source=('git://github.com/Baitinq/dwm.git')
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname"
    chmod -R 777 "$pkgdir/usr/share/$pkgname"
    chmod +x "$pkgdir/usr/share/$pkgname/scripts/dwm-status"
}
