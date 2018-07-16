# Maintainer:
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.21
pkgrel=3
pkgdesc="A map editor for the classic DOOM games"
arch=('i686' 'x86_64')
url="http://eureka-editor.sourceforge.net"
license=('GPL')
depends=('fltk')
source=("https://download.sourceforge.net/eureka-editor/eureka-121-source.tar.gz"
        "eureka.patch")
sha256sums=('39ce6ce40137be3f8391a513adc533a616fc0a8c5e51c4e4f9cc9912fb71f7a8'
            'f2f3f1f7927997a2ddebf1abb477c77d46b7b2c7d7b69fd10f782771eefb176a')

prepare() {
  cd $pkgname-$pkgver-source

  # patch Makefile
  patch -p1 -i ../eureka.patch
}

build() {
  cd $pkgname-$pkgver-source

  make PREFIX=/usr OPTIMISE="$CXXFLAGS $CPPFLAGS"
}

package() {
  cd $pkgname-$pkgver-source

  make PREFIX="$pkgdir"/usr install

  install -Dm644 misc/eureka.xpm "$pkgdir"/usr/share/pixmaps/eureka.xpm
  install -Dm644 misc/eureka.desktop "$pkgdir"/usr/share/applications/eureka.desktop
  install -Dm644 misc/eureka.6 "$pkgdir"/usr/share/man/man6/eureka.6
}
