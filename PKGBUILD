# Maintainer: Johan Rehnberg <cleanrock@gmail.com>
pkgname=flobby-git
pkgver=0.2.138.g6c9a288
pkgrel=1
pkgdesc="spring lobby client"
arch=('i686' 'x86_64')
url="https://github.com/cleanrock/flobby"
license=('GPL2')
groups=()
depends=('jsoncpp' 'graphicsmagick' 'libxpm' 'libxss' 'boost-libs' 'curl')
makedepends=('git' 'cmake' 'boost' 'minizip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/cleanrock/flobby.git')
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
  rm -rf "$srcdir/$_gitname/build"
  mkdir "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"
  
  # use this cmake line instead of above to skip building and installing pr-downloader
  cmake -DWITH_PRD=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
