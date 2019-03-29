# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: max_meyer 
# Contributor: popsch
# Based on original tikzit-aur-package made by pippin

pkgname=tikzit
pkgver=2.1.4
pkgrel=1
pkgdesc="Allows the creation and modification of TeX diagrams written using the pgf/TikZ macro library"
arch=('i686' 'x86_64')
url="https://tikzit.github.io/"
license=('GPL2')
depends=('qt5-base')
optdepends=('texlive-core: previews')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tikzit/tikzit/archive/v$pkgver.tar.gz")
sha256sums=('14443ab430ff20e5c3b185a704932858afb3d776aa9b3a54e1b9898d5b9c13a8')

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
