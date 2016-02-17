# Maintainer: Luke Granger-Brown <archlinux@lukegb.com>
pkgname=x509ls-git
pkgver=r29.cc82552
pkgrel=1
pkgdesc="ncurses-based SSL certificate viewer"
arch=(x86_64)
url="https://github.com/skip2/x509ls"
license=('MIT')
groups=()
depends=('ncurses' 'openssl')
makedepends=('git' 'cmake')
provides=('x509ls')
conflicts=('x509ls')
replaces=('x509ls')
backup=()
options=()
install=
source=('git://github.com/skip2/x509ls.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot='git://github.com/skip2/x509ls.git'
_gitname=x509ls

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr $srcdir/$_gitname
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
