# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=('cutelyst-tutorial-git')
pkgver=3.0.0
pkgrel=2
pkgdesc="The Wiki tutorial from Github as a local copy"
arch=('any')
url="http://cutelyst.org"
license=('LGPL2.1')
makedepends=('git' 'discount')
source=(
    'git+https://github.com/cutelyst/cutelyst.wiki.git'
    'default.css'
    'proc.sh'
)
sha512sums=('SKIP'
            '6f5d6f353d66f785ada9c5060c01d2fec7a2b4dba642d81da59e2f0021351129569b20e741cc0b7f9b16abf7ae6447b1617b51054dfbe5e08fada7af1d529451'
            'f9934c57e4b9344efabb209f174cdde76dc45fc24601c8d23390130ab749743d87f8650846c4172728546fdeb59890f589f14d4222f546da3c79773bdf80940b')

build() {
  cd ${srcdir}/cutelyst.wiki
  ../proc.sh html
}

package() {
  cd ${srcdir}/cutelyst.wiki/html
  local t=usr/share/doc/cutelyst/tutorial
  install -d -m755 ${pkgdir}/$t
  install -m644 *.html ${pkgdir}/$t
  install -m644 ${startdir}/default.css ${pkgdir}/$t
}
