# Maintainer: DeedleFake <deedlefake at users.noreply.github.com>
pkgname=complx-git
pkgver=4.10.0.0
pkgrel=2
pkgdesc="Complx the LC-3 Simulator used in CS2110 managed by Brandon"
arch=('i686' 'x86_64')
url="https://www.github.com/TricksterGuy/complx"
license=('unknown')
depends=('wxgtk')
makedepends=('git' 'webkitgtk2')
provides=('complx')
conflicts=('complx')

_gitroot=https://www.github.com/TricksterGuy/complx
_gitname=complx

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
