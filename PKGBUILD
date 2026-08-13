# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
_pkgname=dosbox-x
pkgver=2026.07.02
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL-2.0-or-later)
depends=(fluidsynth libxkbfile libxrandr sdl2_net libslirp libpng libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
	ffmpeg9.patch)
sha256sums=('ca380ea617ce2d9165f379e6d01a481ec5a26fcf4fa31490e1e04ffdb4030730'
            'e8c7786f078d5cc0eb97b9d21a6e85075f6583b6012eceb1b693df3aab435a28')
install=dosbox-x.install
options=(!debug)

prepare() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  patch -p1 -i ../ffmpeg9.patch
}

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  ./autogen.sh
  ./configure --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make
  
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
