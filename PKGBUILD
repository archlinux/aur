# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
pkgver=0.83.14
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr ffmpeg sdl2_net libslirp)
makedepends=(glu physfs)
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('d27e1b796e22104c1cc822ee3255c07275e5ebbb6e29d8eda07dbf9feefc53e8')

build() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  ./autogen.sh
  chmod +x configure
  ./configure --enable-core-inline --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)
}

package() {
  cd "$srcdir/dosbox-x-dosbox-x-v$pkgver"
  make DESTDIR="$pkgdir" install
}
