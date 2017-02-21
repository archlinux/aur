# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=froggix
pkgver=0.1
pkgrel=6
pkgdesc="A clone of the classic arcade game Frogger"
arch=('any')
license=('GPL3' 'custom')
url="https://sourceforge.net/projects/froggix"
depends=('python2-pygame')
makedepends=('gendesk')
source=("https://downloads.sourceforge.net/froggix/Froggix.tar.gz"
        "froggix-highscore-path.patch"
        "froggix.sh")
sha256sums=('7d5426e6c64fbd44255b40ba33f39baf823f9fb4e85ad771e20c7bac0d7c6eb3'
            'a3635b29f144a580fa3b08d55234de37e61c4fbb0ae584c345ed2f65b08ef2a3'
            '8f09f17d54a8ab0db27ef1b1cce48b90021fb204a32eb9789b8d93d648b7d59a')

prepare() {
  cd $pkgname
  patch -p1 < ../froggix-highscore-path.patch
  gendesk -n --pkgname=$pkgname --comment="A Frogger clone" \
    --categories="Application;Game;ArcadeGame;"
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/froggix/data
  install -m 644 froggix.py README "$pkgdir"/usr/share/froggix
  install -m 644 data/* "$pkgdir"/usr/share/froggix/data
  install -D -m 755 ../froggix.sh "$pkgdir"/usr/bin/froggix
  install -D -m 644 Credits_and_Licenses "$pkgdir"/usr/share/licenses/$pkgname/Credits_and_Licenses
  install -D -m 644 froggix.desktop "$pkgdir"/usr/share/applications/froggix.desktop
  install -D -m 644 data/icon.png "$pkgdir"/usr/share/pixmaps/froggix.png
}
