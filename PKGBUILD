# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=sshgrid-git
pkgver=20110606
pkgrel=1
pkgdesc="Poor-man's grid computing via SSH"
arch=(any)
url="https://github.com/sseemayer/SSHGrid"
license=('GPL')
groups=()
depends=(perl openssh)
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

_gitroot="git://github.com/sseemayer/SSHGrid.git"
_gitname="sshgrid-gitrepo"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_gitname-build"
  perl Build install
} 
