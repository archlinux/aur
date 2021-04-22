# Mantainer: Franco Tortoriello

pkgname=dosbox-x-sdl2-git
pkgver=13936.3b79b1d74
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features - sdl2 git version"
arch=(i686 x86_64)
url="http://dosbox.sourceforge.net"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr mesa ffmpeg sdl2_net physfs)
makedepends=(git glu)
optdepends=()
conflicts=(dosbox-x-sdl2 dosbox-x-git)
install='dosbox-x.install'
source=(dosbox-x::git://github.com/joncampbell123/dosbox-x.git)
sha256sums=('SKIP')

pkgver() {
  cd "$SRCDEST/dosbox-x"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/dosbox-x"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  ./autogen.sh
  ./configure --enable-core-inline --disable-debug --enable-avcodec --prefix=/usr --enable-sdl2
  make -j$(nproc)  
}

package() {
  cd "$srcdir/dosbox-x"
  make DESTDIR="$pkgdir" install
}

