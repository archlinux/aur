# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=adplay
pkgver=1.8.1
pkgrel=1
pkgdesc='AdLib sound player tool'
arch=('i686' 'x86_64')
url="https://github.com/adplug/adplay-unix"
license=('GPL')
depends=('adplug')
source=(
  "https://github.com/adplug/adplay-unix/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2"
  'default-players.patch'
)
sha256sums=('eb36bd6a7066980ce5b72aa710a784dfb37a0ffe6dfc506a5eeef6c7485edfd5'
            '5128c9504fbca78f7b3a36cbfdd67b315ea68fb28743f72d8cb17f27cedbed10')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Change priority of default output. players.h was last touched in 2006,
  # before PulseAudio became the default on everyone's desktops.
  patch -Np0 -i "$srcdir/default-players.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
