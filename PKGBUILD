# Maintainer: Michael Straube <michael_straube@web.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.11
pkgrel=2
pkgdesc="A map editor for the classic DOOM games"
arch=('i686' 'x86_64')
url="http://eureka-editor.sourceforge.net"
license=('GPL2')
depends=('fltk')
source=("https://download.sourceforge.net/eureka-editor/eureka-111-source.tar.gz"
        "makefile.patch")
sha1sums=('7e19a139e71893a85aff49520b5e9a9e55224ccc'
          'd84f90164b8561d673f673255028a0a4c7b63f2a')

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
