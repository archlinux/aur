# Maintainer: Runney Wu <an9wer@gmail.com>

_commit=f09418b
_pkgname=dwm
pkgname=an9wer-dwm
pkgver=6.2.r5.gf09418b
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('x86_64')
license=('MIT')
groups=('an9wer-suckless')
makedepends=('git')
depends=('libx11' 'libxft' 'libxinerama' 'an9wer-suckless-rebuild>=0.1.4')
source=("$_pkgname::git://git.suckless.org/dwm#commit=$_commit")
md5sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cp config.def.h config.h
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README  "$pkgdir/usr/share/doc/$_pkgname/README"
  # Source codes
  install -m644 -D -t "$pkgdir/usr/src/$_pkgname" \
    config.def.h config.mk drw.c drw.h dwm.1 dwm.c dwm.png \
    LICENSE Makefile README transient.c util.c util.h
}
