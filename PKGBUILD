# Maintainer: nandub <dev@nandub.info>
# Contributor: plmday

pkgname=io-git
pkgver=20110905
pkgrel=3
pkgdesc="Io is a prototype-based programming language inspired by Smalltalk"
arch=('i686' 'x86_64')
url="http://www.iolanguage.com/"
license=('BSD')
depends=('libevent' 'yajl' 'pcre')
makedepends=('git' 'cmake')
conflicts=('io')

_gitroot="https://github.com/stevedekorte/io.git"
_gitname="io"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "build"
  mkdir "build"
  cd "build"

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
