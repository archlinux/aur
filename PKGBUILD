# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtikz-git
pkgver=r317.37ae35f
pkgrel=1
pkgdesc="Small application helping you to create TikZ diagrams"
arch=('i686' 'x86_64')
url="https://github.com/fhackenberger/ktikz"
license=('GPL')
depends=('poppler-qt5')
makedepends=('git' 'qt5-tools' 'texlive-core')
provides=('qtikz')
conflicts=('qtikz')
source=("qtikz::git+https://github.com/fhackenberger/ktikz")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-git}"
  qmake qtikz.pro
  make
}

package() {
  cd "${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir" install
}


