# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=matcher-git
pkgver=1.0.0.r0.g6c54c26
pkgrel=1
pkgdesc="Intelligently searches through a list of file names for the one you were probably looking for."
arch=('i686' 'x86_64')
url="https://github.com/burke/matcher"
license=('BSD2')
makedepends=('git')
provides=('matcher')
conflicts=('matcher')
source=("git+https://github.com/burke/matcher" "matcher-git.patch")
md5sums=('SKIP' 'f96518bab54f9dd6b404bb7378a52b07')
_gitrepo=matcher

pkgver() {
  cd "$_gitrepo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_gitrepo"
  patch -p1 <../matcher-git.patch
}

build() {
  cd "$_gitrepo"
  make
}

package() {
  cd "$_gitrepo"
  make DESTDIR="$pkgdir/" install
}
