# Maintainer: Devaux Fabien <fdev31@gmail.com>
pkgname=kvazaar-git
pkgver=0.2.0
pkgrel=1
pkgdesc="An open-source HEVC encoder"
arch=('i686' 'x86_64')
url="https://github.com/ultravideo/kvazaar"
license=('GPL2')
groups=()
depends=()
makedepends=('git' 'yasm')
provides=('kvazaar')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/ultravideo/kvazaar.git
_gitname=kvazaar

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

  #
  # BUILD HERE
  #
  cd src
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/$_gitname"
  cp src/$_gitname "$pkgdir/usr/bin/"
  cp README.md "$pkgdir/usr/share/doc/$_gitname/"
}

# vim:set ts=2 sw=2 et:
