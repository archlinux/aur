# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtikz-git
pkgver=r196.ab7bd73
pkgrel=2
pkgdesc="Small application helping you to create TikZ diagrams"
arch=('i686' 'x86_64')
url="https://github.com/fhackenberger/ktikz"
license=('GPL')
depends=('poppler-qt5' 'shared-mime-info' 'desktop-file-utils')
makedepends=('git' 'texlive-core' 'qt5-tools')
provides=('qtikz')
conflicts=('qtikz')
install=qtikz.install
source=("qtikz::git+https://github.com/fhackenberger/ktikz" config.diff makefile.diff)
md5sums=('SKIP'
         'ff93a529fe32d095a6390a629c51bece'
         '4eb8ee23d0762037887d1003daf55c30')
_gitname=qtikz

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
  qmake qtikz.pro
  patch -p0 -F3 < "$srcdir"/makefile.diff
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir" install
}


