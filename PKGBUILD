# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=giada
pkgver=0.10.2
pkgrel=2
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
depends=('fltk' 'jack' 'libpulse' 'libxpm' 'rtmidi')
source=("${pkgname}-${pkgver}-src.tar.gz::http://www.giadamusic.com/download/grab/source"
        'http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip'
        "$pkgname.desktop"
        "$pkgname.png")
install="$pkgname.install"
md5sums=('90f15313393b3bd11b6fe958665aed93'
         '1ac422ebb4aa2e86061278412c347b55'
         '06238158680470ab01fbbeb33353e58e'
         'f9b6e4233890720af50c536c4b2c92c0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"

  rm -rf src/deps/vst
  ln -sf "$srcdir/VST3 SDK/pluginterfaces/vst2.x" src/deps/vst
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"

  ./configure --prefix=/usr --target=linux --enable-vst
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
