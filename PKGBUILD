# Maintainer: Daniel YC Lin <dlin.tw at gmail>
pkgname=genseat-git
pkgver=20130617
pkgrel=1
pkgdesc="Generate script for Xephyr multiseat on demand"
arch=(x86 x86_64)
url="https://github.com/dlintw/genseat"
license=('MIT')
depends=(go xorg-server-xephyr xorg-xinput xorg-setxkbmap)
makedepends=('git')
source=()
md5sums=()

_gitroot=https://github.com/dlintw/genseat.git
_gitname=genseat

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

  go build -o $_gitname
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  cp genseat $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
