# Maintainer: Your Name <jachymb@gmail.com>
pkgname=gltl2ba-git
pkgver=1
pkgrel=1
pkgdesc="Enriches ltl2ba with graph generation capabilities"
arch=('x86_64')
url="https://github.com/PatrickTrentin88/gltl2ba"
license=('GPLv3')
groups=()
depends=('ltl2ba' 'graphviz' 'python-graphviz')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot=https://github.com/PatrickTrentin88/gltl2ba.git
_gitname=$pkgname

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -m755 -D gltl2ba "$pkgdir/usr/bin/gltl2ba"
}

# vim:set ts=2 sw=2 et:
