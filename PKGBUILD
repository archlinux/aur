# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dosbox-x-sdl2
_pkgname=dosbox-x
pkgver=2024.07.01
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches and more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libxrandr sdl2_net libslirp)
makedepends=(glu)
optdepends=()
conflicts=('dosbox-x-git' 'dosbox-x' 'dosbox-x-sdl2-git')
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)
sha256sums=('23462a3398303f8558e86973af9ba5d3d6d53bdaf324ec749610f2baf1dd449b')
	    
options=(!debug)

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
