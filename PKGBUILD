# Maintainer: Roel Kluin <r.o.e.lkluin@gmail.com>
pkgname=camlp4-git
pkgver=4.02+6.r2.g074db4c
pkgrel=1
pkgdesc=""
arch=('x86_64' 'i686')
url="https://github.com/ocaml/camlp4/tree/4.02"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
md5sums=()

_gitroot='https://github.com/ocaml/camlp4.git'
_gitname='camlp4'
_branch=4.02

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone -b $_branch "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -b $_branch "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --bindir=/usr/bin --libdir=/usr/share/$_gitname
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

