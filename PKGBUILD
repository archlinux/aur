# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
_pkgname=dosbox-x
pkgver=2026.05.02
pkgrel=2
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL-2.0-or-later)
depends=(fluidsynth libxkbfile libxrandr sdl2_net libslirp libpng libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('5ab3584870bec378b495242f20f03ecbef2cd032a128ee3394a88ff7a53cd914')
install=dosbox-x.install
options=(!debug)

prepare() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
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
