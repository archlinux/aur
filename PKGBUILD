# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=froggix
pkgver=0.1
pkgrel=5
pkgdesc="A clone of the classic arcade game Frogger"
arch=('any')
license=('GPL3' 'custom')
url="https://sourceforge.net/projects/froggix"
depends=('python2-pygame')
source=("https://downloads.sourceforge.net/froggix/Froggix.tar.gz"
        "froggix-highscore-path.patch"
        "froggix.desktop"
        "froggix.sh")
sha256sums=('7d5426e6c64fbd44255b40ba33f39baf823f9fb4e85ad771e20c7bac0d7c6eb3'
            'a3635b29f144a580fa3b08d55234de37e61c4fbb0ae584c345ed2f65b08ef2a3'
            '922a725cd9c2f1b67066d3c9c5f2579f6002178e55a09c5e6890bd136c4c46c6'
            '7e6c380cedbc20ffd338b508afecd7617252dd137ae3cd5139b095b73f819276')

prepare() {
  cd $pkgname
  patch -p1 < ../froggix-highscore-path.patch
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/froggix/data
  install -m 644 froggix.py README "$pkgdir"/usr/share/froggix
  install -m 644 data/* "$pkgdir"/usr/share/froggix/data
  install -D -m 755 ../froggix.sh "$pkgdir"/usr/bin/froggix
  install -D -m 644 Credits_and_Licenses "$pkgdir"/usr/share/licenses/$pkgname/Credits_and_Licenses
  install -D -m 644 ../froggix.desktop "$pkgdir"/usr/share/applications/froggix.desktop
  install -D -m 644 data/icon.png "$pkgdir"/usr/share/pixmaps/froggix.png
}
