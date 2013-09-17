# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=alex4
pkgver=1.1
pkgrel=4
pkgdesc="Help Alex the Allegator rescue Lola before the humans make a pair of shoes out of her!"
url="http://allegator.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dumb')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/allegator/Alex4/source%20and%20data/alex4src_data.zip"
        "unix-port.patch"
        "allegro-4.2.patch"
        "$pkgname.png"
        "$pkgname.desktop"
        "$pkgname.install")
md5sums=('c81b8e3813300a0cfbe828bcdff60fda'
         '8dcafad79e34fc9adb78a49b6933e10c'
         'f9ccd450934d346deec450e91ecfc42e'
         '1c21affded614148ad06deb1bb59086c'
         '96f6ee8ce4fc268d5161e5294cfe565e'
         'f5bfcc2b2378cf34ab0491e8a8da6c23')
sha256sums=('d266d7fba64fbfedf13240d3d0eb21b8bacbedeaa5f22b26a27d472c8d23f103'
            '5bb70ca82bcd0df0ed72eccada0c9ccb37a570d7c62ea8a076bdf2169a15c2e5'
            'ea3e6ffd558cbdb6c392d598499f0780de8c0e456da554531c5c975fe8688d28'
            '236a8d163ee8aa94073aa1ec969a85e887b3c70fefbcd03b1f41b93b09fa32c6'
            'b7fc0854e9a07f08bd90f59aaf99011afc3c6c2a0ad0b244ec04694ce0ff19dd'
            '9a9589ca7ab7792cadeb6529141b9d719356d989a7393d7eab322b88c6f27965')

prepare() {
  cd $srcdir/alex4src

  patch -p1 -N -i $srcdir/unix-port.patch
  patch -p1 -N -i $srcdir/allegro-4.2.patch
}

build() {
  cd $srcdir/alex4src/src

  LDFLAGS=-lm make PREFIX=/usr
}

package() {
  cd $srcdir/alex4src/src

  make PREFIX=$pkgdir/usr install

  install -Dm644 ../$pkgname.ini $pkgdir/usr/share/$pkgname

  # install desktop entry
  install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/icons/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
