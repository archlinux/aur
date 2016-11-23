# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtikz-git
pkgver=r202.be66c8b
pkgrel=1
pkgdesc="Small application helping you to create TikZ diagrams"
arch=('i686' 'x86_64')
url="https://github.com/fhackenberger/ktikz"
license=('GPL')
depends=('poppler-qt4')
makedepends=('git' 'texlive-core')
provides=('qtikz')
conflicts=('qtikz')
source=("qtikz::git+https://github.com/fhackenberger/ktikz" config.diff)
md5sums=('SKIP'
         '97d5fd5f3cfdf691101c39ae35f69753')
_gitname=qtikz
options=('!makeflags')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"/qmake
  patch -p0 < "$srcdir"/config.diff
}

build() {
  cd "$_gitname"
  qmake-qt4 qtikz.pro
  
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir" install
}


