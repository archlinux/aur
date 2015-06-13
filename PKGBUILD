# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=punt-git
pkgver=20090731
pkgrel=1
pkgdesc="A simple sexp-based programming language."
arch=('i686' 'x86_64')
#url="http://punt.archuser.com"
url="https://bbs.archlinux.org/viewtopic.php?id=73888"
license=('GPL3')
makedepends=('git')
source=("git+https://github.com/peasantoid/punt.git")
md5sums=('SKIP')

_gitname="punt"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"

  sed -e 's|/usr/local|/usr|' -i make
  ./make
}

package() {  
  cd "$_gitname"
  install -d "$pkgdir/usr/"{bin,lib/punt}
  install -m755 build/punt/punt "$pkgdir/usr/bin"
  install -m644 build/modules/*.so "$pkgdir/usr/lib/punt/"
} 
