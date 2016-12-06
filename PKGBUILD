# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.11
pkgrel=3
pkgdesc="A map editor for the classic DOOM games"
arch=('i686' 'x86_64')
url="http://eureka-editor.sourceforge.net"
license=('GPL')
depends=('fltk')
source=("https://download.sourceforge.net/eureka-editor/eureka-111-source.tar.gz"
        "makefile.patch")
sha256sums=('c29988b7e974ce61e7744ace8f768db48af926b453e604016faafc8b9e479735'
            '925edf9d4f9a52776df0e011e1c9fd1b978adb3043f4d8d56ae4caa9c558d71b')

prepare() {
  cd $pkgname-$pkgver-source

  patch -p1 -i ../makefile.patch
}

build() {
  cd $pkgname-$pkgver-source

  make PREFIX=/usr OPTIMISE="$CXXFLAGS"
}

package() {
  cd $pkgname-$pkgver-source

  make PREFIX="$pkgdir"/usr install

  install -Dm644 misc/eureka.xpm "$pkgdir"/usr/share/pixmaps/eureka.xpm
  install -Dm644 misc/eureka.desktop "$pkgdir"/usr/share/applications/eureka.desktop
  install -Dm644 misc/eureka.6 "$pkgdir"/usr/share/man/man6/eureka.6
}

# vim:set ts=2 sw=2 et:
