# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Peter <craven@gmx.net>
pkgname=oaklisp-git
pkgver=0.1
pkgrel=1
pkgdesc="Oaklisp is a portable lisp interpreter / compiler for the Oaklisp dialect of lisp."
arch=(x86_64 i386)
url="https://github.com/barak/oaklisp"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'autoconf')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()



noextract=()
#generate with 'makepkg -g'

_gitroot=https://github.com/barak/oaklisp
_gitname=oaklisp

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
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
