# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=giada
pkgver=0.14.2
pkgrel=1
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
depends=('fltk' 'jansson' 'libpulse' 'libxpm' 'rtmidi')
makedepends=('steinberg-vst36')
source=("${pkgname}-${pkgver}-src.tar.gz::http://www.giadamusic.com/download/grab/source"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('98cf8cac8eb51659a896613db81b73ae'
         '06238158680470ab01fbbeb33353e58e'
         'f9b6e4233890720af50c536c4b2c92c0')
changelog='ChangeLog'

build() {
  cd "$srcdir/$pkgname-$pkgver-src"

  export CXXFLAGS="$CXXFLAGS -Wno-error"
  ./configure --prefix=/usr --target=linux --enable-vst
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"

  export CXXFLAGS="$CXXFLAGS -Wno-error"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
