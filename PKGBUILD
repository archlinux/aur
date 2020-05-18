# Maintainer: Runney Wu <an9wer@gmail.com>

_commit=045a0fa
_pkgname=st
pkgname=an9wer-$_pkgname
pkgver=0.8.3.r9.g045a0fa
pkgrel=4
pkgdesc="A simple terminal implementation for X"
url="https://st.suckless.org/"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('xorgproto' 'libx11' 'libxft' 'an9wer-suckless-rebuild>=0.1.0')
install=$pkgname.install
source=("$_pkgname::git://git.suckless.org/st")
md5sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cp config.def.h config.h
}

pkgver() {
  cd "$_pkgname"
  git checkout "$_commit" &> /dev/null
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
  install -m644 -D -t "$pkgdir/usr/src/st" \
    arg.h config.def.h config.mk FAQ LEGACY LICENSE \
    Makefile README st.1 st.c st.h st.info TODO win.h x.c
}
