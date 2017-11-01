# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=alex4
pkgver=1.2.alpha
pkgrel=1
pkgdesc="Help Alex the Allegator rescue Lola before the humans make a pair of shoes out of her!"
url="http://allegator.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('aldumb' 'allegro4')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/carstene1ns/alex4/archive/${pkgver%.*}-alpha.tar.gz"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('0fe6e9341d52623503c87f778926c33e17f393059e8a572e779e1a15f678414a'
            '236a8d163ee8aa94073aa1ec969a85e887b3c70fefbcd03b1f41b93b09fa32c6'
            '780063f3f8b72f9a4310a4929f9a3b3a229ada199a2175e04b65cd49ff1e2644')

build() {
  make -C $pkgname-${pkgver%.*}-alpha/src PREFIX=/usr
}

package() {
  cd $pkgname-${pkgver%.*}-alpha

  make -C src PREFIX=/usr DESTDIR="$pkgdir/" install
  # config
  install -Dm0644 alex4.ini "$pkgdir"/usr/share/alex4/alex4.ini
  # desktop entry
  install -Dm0644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm0644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
