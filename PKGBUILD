# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=alex4
pkgver=1.1
pkgrel=5
pkgdesc="Help Alex the Allegator rescue Lola before the humans make a pair of shoes out of her!"
url="http://allegator.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dumb')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/allegator/Alex4/source%20and%20data/alex4src_data.zip"
        "$pkgname.png"
        "unix-port.patch"
        "allegro-4.2.patch"
        "$pkgname.desktop")
sha256sums=('d266d7fba64fbfedf13240d3d0eb21b8bacbedeaa5f22b26a27d472c8d23f103'
            '236a8d163ee8aa94073aa1ec969a85e887b3c70fefbcd03b1f41b93b09fa32c6'
            '5bb70ca82bcd0df0ed72eccada0c9ccb37a570d7c62ea8a076bdf2169a15c2e5'
            'ea3e6ffd558cbdb6c392d598499f0780de8c0e456da554531c5c975fe8688d28'
            'b7fc0854e9a07f08bd90f59aaf99011afc3c6c2a0ad0b244ec04694ce0ff19dd')

prepare() {
  cd alex4src

  # make compatible with modern environment
  patch -Np1 < ../unix-port.patch
  patch -Np1 < ../allegro-4.2.patch
}

build() {
  cd alex4src/src

  LDFLAGS=-lm make PREFIX=/usr
}

package() {
  cd alex4src

  make -C src PREFIX="$pkgdir/usr" install
  install -Dm644 alex4.ini "$pkgdir"/usr/share/alex4/alex4.ini
  # desktop entry
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
