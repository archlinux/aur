# Mantainer: 32th System

pkgname=dosbox-x-sdl2
pkgver=0.82.19
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg sdl2)
makedepends=(glu)
optdepends=()
source=(dosbox-x::https://codeload.github.com/joncampbell123/dosbox-x/tar.gz/dosbox-x-v$pkgver
	dosbox-x.png
	dosbox-x.desktop)
build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  ./autogen.sh
  chmod +x vs2015/sdl/build-scripts/strip_fPIC.sh
  chmod +x configure
  ./configure --enable-core-inline --disable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/dosbox-x.png" \
	"$pkgdir/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "$srcdir/dosbox-x.desktop" \
	"$pkgdir/usr/share/applications/dosbox-x.desktop"
}

md5sums=('76648eabd63f9abab0ec27cef8c0daaa'
         '3dcfe45c5ed0433316eaea51e3620b36'
	 '0805320c602969deaa682915308e9c21')
