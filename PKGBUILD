# Maintainer: muzhed <chustokes@126.com>

pkgname=din
pkgver=32
pkgrel=1
pkgdesc="A sound synthesizer and musical instrument."
arch=("i686" "x86_64")
url="http://dinisnoise.org/"
license=('GPL2')
depends=('jack' 'libgl' 'sdl' 'tcl')
makedepends=('boost')
source=("https://archive.org/download/dinisnoise_source_code/$pkgname-$pkgver.tar.gz"
        din.png
        din.desktop)
md5sums=('e80b3c11f265d4f47055213e3821a1aa'
         '50ca4dc107eaa0d5b6a1efe21c469bd7'
         'e38840354b0f197079e6bbeda03c8613')

build() {
  cd "$srcdir"/"$pkgname-$pkgver"

  autoreconf -fvi
  # use alsa instead of jack
  # ./configure --prefix=/usr CXXFLAGS="-O3 -D__UNIX_ALSA__" CFLAGS=-O3
  ./configure --prefix=/usr CXXFLAGS="-O3 -D__UNIX_JACK__" CFLAGS=-O3
  make
}

package() {
  cd "$srcdir"/"$pkgname-$pkgver"
  make install DESTDIR=$pkgdir
  # install license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/din/LICENSE"

  # install icon and desktop file
  cd "$srcdir"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
