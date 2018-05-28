# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin

pkgname=tikzit-git
pkgver=r376
pkgrel=1
pkgdesc="Creation and modification of TeX diagrams written using the pgf/TikZ macro library - rewrite in QT and C++"
arch=('i686' 'x86_64')
url="https://github.com/tikzit/tikzit.git"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
provides=('tikzit')
source=('git+https://github.com/tikzit/tikzit.git')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s" "$(git rev-list --count HEAD)"
}
 
build() {
  cd ${pkgname%-git}
  qmake PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" tikzit.pro  
  make -j1
}

package() {
  cd ${pkgname%-git}
  install -Dm755 tikzit "$pkgdir"/usr/bin/tikzit-qt
}
