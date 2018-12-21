# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin

pkgname=tikzit-git
pkgver=2.0.34.g873316d
pkgrel=1
pkgdesc="Creation and modification of TeX diagrams written using the pgf/TikZ macro library - rewrite in QT and C++"
arch=('i686' 'x86_64')
url="https://tikzit.github.io/"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils' 'hicolor-icon-theme' 'poppler-qt5')
makedepends=('git')
provides=('tikzit')
conflicts=('tikzit')
source=('git+https://github.com/tikzit/tikzit.git')
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  printf "%s" "$(git describe --tags | cut -c2- |tr - .)"
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
  make -j1 INSTALL_ROOT="$pkgdir" install 
}
