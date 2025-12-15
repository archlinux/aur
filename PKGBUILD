# Mantainer: Franco Tortoriello

pkgname=dosbox-x-sdl2-git
pkgver=2025.12.01.r36.g9dc2fd31e
pkgrel=1
epoch=3
pkgdesc="x86 emulator with builtin DOS, with patches with more features - sdl2 git version"
arch=(i686 x86_64)
url="https://dosbox-x.com/"
license=(GPL-2.0-or-later)
depends=(fluidsynth libxkbfile libxrandr ffmpeg sdl2_net libslirp libpng libpcap)
makedepends=(git glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-sdl2 dosbox-x-git dosbox-x)
install='dosbox-x.install'
source=(dosbox-x::git+https://github.com/joncampbell123/dosbox-x.git)
sha256sums=('SKIP')
options=(!debug)
          
pkgver() {
  cd "$srcdir/dosbox-x"
  git describe --long --tags | sed 's/^dosbox.x-//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd "$srcdir/dosbox-x"
  
  ./autogen.sh
  ./configure --enable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
}
