# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=lcf2xml-git
pkgver=r23.0161554
pkgrel=1
pkgdesc="EasyRPG's converter tool (RPG Maker 2000/2003 projects<>XML, development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
conflicts=('lcf2xml')
provides=('lcf2xml')
makedepends=('git')
depends=('expat' 'gcc-libs' 'liblcf-git')
source=(lcf2xml::"git+https://github.com/EasyRPG/lcf2xml.git")
md5sums=('SKIP')

pkgver() {
  cd lcf2xml
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd lcf2xml

  # compile with our flags
  g++ $CXXFLAGS src/main.cpp $(pkg-config --cflags --libs liblcf) $LDFLAGS -o lcf2xml
}

package () {
  cd lcf2xml

  install -Dm755 lcf2xml "$pkgdir"/usr/bin/lcf2xml
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
