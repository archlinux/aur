# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=sugar-activity-turtleblocks
_pkgname=activity-turtleart-gtk3
pkgver=213
pkgrel=1
pkgdesc="Logo-inspired graphical turtle for Sugar"
arch=('any')
url="https://wiki.sugarlabs.org/go/Activities/Turtle_Art"
license=('MIT')
groups=('sugar-fructose')
depends=('gconf' 'sugar-toolkit-gtk3')
makedepends=('git')
_commit=2f5cb5a5348c552db898dd7de909b38312c71023  # master
source=("git+https://github.com/sugarlabs/activity-turtleart-gtk3#commit=$_commit"
        "0001-Port-more-parts-to-gtk3.patch")
sha256sums=('SKIP'
            '9dc1c4d9510184881d054e04470fe78c1de2889bec3adf03a9e2841e27f5431e')

prepare() {
  cd $_pkgname
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  patch -Np1 -i ../0001-Port-more-parts-to-gtk3.patch
}

package() {
  cd $_pkgname
  python2 setup.py install --prefix "$pkgdir/usr"
  mv "$pkgdir"/usr/share/{sugar/activities/TurtleBlocks.activity,applications}/turtleblocks.desktop
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
