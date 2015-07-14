# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname='cpdup-git'
pkgver=20111103
pkgrel=1
pkgdesc='A comprehensive filesystem mirroring program - Git Version'
url='http://apollo.backplane.com/FreeSrc/'
arch=('i686' 'x86_64')
license=('BSD')
depends=()

source=()
md5sums=()

_gitroot='https://github.com/drizztbsd/cpdup.git'
_gitname='cpdup'

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 cpdup "${pkgdir}/usr/bin/cpdup"
  install -Dm644 cpdup.1 "${pkgdir}/usr/share/man/man1/cpdup.1"
}
