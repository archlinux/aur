# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
pkgname=gdbwire-git
pkgver=r183.549b001
pkgrel=1
pkgdesc="portable lightweight library for communicating with the GDB"
arch=('i686' 'x86_64')
url="https://github.com/brasko/gdbwire"
license=('GPL')
makedepends=('git' 'flex' 'bison')
source=("git+$url")
noextract=()
md5sums=('SKIP')

_gitname=gdbwire

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
