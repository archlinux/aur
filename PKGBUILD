# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=cmake-modules-webos-git
pkgver=20121229
pkgrel=1
pkgdesc='CMake modules needed to build Open webOS components'
arch=(i686 x86_64)
url='https://github.com/openwebos/cmake-modules-webos'
license=('Apache')
provides=('cmake-modules-webos')
pkgver=20121229
depends=('cmake')
makedepends=('git')

_gitroot=https://github.com/openwebos/cmake-modules-webos
_gitname=master

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
  mkdir "$srcdir/$_gitname-build"
  # git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
