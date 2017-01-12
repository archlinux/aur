# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.21
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
arch=('i686' 'x86_64')
url="http://eureka-editor.sourceforge.net"
license=('GPL')
depends=('fltk')
source=("https://download.sourceforge.net/eureka-editor/eureka-121-source.tar.gz"
        "eureka.patch")
sha256sums=('39ce6ce40137be3f8391a513adc533a616fc0a8c5e51c4e4f9cc9912fb71f7a8'
            '4a4bc8ec5f164b647ac395d3242f44eb2440cb3b79ad55063cbefeda9781149a')

prepare() {
  cd $pkgname-$pkgver-source

  # patch Makefile
  patch -p1 -i ../eureka.patch
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
