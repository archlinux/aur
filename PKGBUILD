# Mantainer: 32th System

pkgname=dosbox-x-sdl2
pkgver=0.82.10
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg sdl2)
makedepends=(glu)
optdepends=()
source=(dosbox-x::https://codeload.github.com/joncampbell123/dosbox-x/tar.gz/v0.82.10
	dosbox-x.png
	dosbox-x.desktop)
_srcdir=dosbox-x-$pkgver
build() {
  cd "$srcdir/$_srcdir"
  ./autogen.sh
  chmod +x vs2015/sdl/build-scripts/strip_fPIC.sh
  chmod +x configure
  ./configure --enable-core-inline --disable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/$_srcdir"
  echo "-----"
  echo "-----"
  echo "-----"
  echo $(pwd)
  echo "-----"
  echo "-----"
  echo "-----"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/dosbox-x.png" \
	"$pkgdir/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "$srcdir/dosbox-x.desktop" \
	"$pkgdir/usr/share/applications/dosbox-x.desktop"
}

md5sums=('0652585eca2b168be3cd367f79532c9c'
         '3dcfe45c5ed0433316eaea51e3620b36'
	 '28e4e75b7e455f39e981de67dd95edeb')
