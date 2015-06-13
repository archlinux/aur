# Maintainer: Johan Rehnberg <cleanrock@gmail.com>
pkgname=flobby-git
pkgver=0.2.52.ga72974c
pkgrel=1
pkgdesc="spring lobby client"
arch=('i686' 'x86_64')
url="https://github.com/cleanrock/flobby"
license=('GPL2')
groups=()
depends=('fltk' 'jsoncpp' 'imagemagick' 'libxpm' 'libxss' 'boost-libs' 'curl')
makedepends=('git' 'cmake' 'boost')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git://github.com/cleanrock/flobby.git')
noextract=()
md5sums=('SKIP')

_gitname=flobby

pkgver() {
  cd "$srcdir/$_gitname"
  # package version is Tag.CommitsSinceTag.CommitId, e.g 0.2.0.gab34413
  git describe --long | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  
  # use this cmake line instead of above to skip building and installing pr-downloader
  #cmake -DWITH_PRD=OFF -DCMAKE_INSTALL_PREFIX=/usr .

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
