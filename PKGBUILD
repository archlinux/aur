# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com>

pkgname=stormbaancoureur
pkgver=2.1.6
pkgrel=2
pkgdesc="An arcade-style car game based on physics"
arch=('i686' 'x86_64')
url="http://www.stolk.org/stormbaancoureur/"
license=('GPL')
depends=('alsa-lib' 'freeglut' 'glu')
makedepends=('ode' 'plib' 'mesa')
source=(http://www.stolk.org/$pkgname/download/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
sha256sums=('c6bd67695734fd430ce8e8d744710531ed4dae1bc78d5cd0529af930144e7903'
            '061782e3defbc500d008af342543c4f7ddc873786c5c34ad173a2d39811e1c7c')

build() {
  cd "$srcdir/$pkgname-$pkgver/src-$pkgname"
  sed -i -e 's/libode.a/libode.so/' Makefile
  sed -i 's|share/games||' Makefile main.cxx
  sed -i 's|usr/games|usr/bin|; 19a\-DdDOUBLE \\' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src-$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
