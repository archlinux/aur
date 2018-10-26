# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin

pkgname=tikzit
pkgver=2.0
pkgrel=2
pkgdesc="Allows the creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="https://tikzit.github.io/"
license=('GPL2')
depends=('qt5-base')
optdepends=('texlive-core: previews')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tikzit/tikzit/archive/v$pkgver.tar.gz")
sha256sums=('d1a84531b8ac2298c140217267423cd9ce4d84ee443b5deb4aa47e4beab4f295')

build() {
  cd $pkgname-$pkgver
  qmake PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" tikzit.pro  
  make -j1
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 tikzit "$pkgdir"/usr/bin/tikzit
}
