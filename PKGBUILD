# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=libde265-git
_gitname=libde265
pkgver=v0.1.1087.ga0c81b6
pkgrel=1
pkgdesc="Open h.265 video codec implementation"
arch=('i686' 'x86_64')
url="https://github.com/strukturag/libde265"
license=('LGPL3')
depends=( "glibc" )
makedepends=( 'git')
conflicts=( "$_gitname" )
provides=( "$_gitname" )
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=( "$_gitname::git+$url" )
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  find "$pkgdir" -name "*.la" -delete
}
