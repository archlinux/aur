# Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=dosbox-x
pkgver=0.83.16
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg physfs)
makedepends=(glu libpcap libslirp)
optdepends=('openglide-git: Third-party 3dfx Glide API support'
 'libpcap: Allows DosBox-X to connect to a network and to the internet'
 'libslirp: Allows DosBox-X to connect to the internet (rootless solution)')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)

sha256sums=('327bb9be5f239407a0fe5ff501ce19d5056ac8b2ce2438fe60a9914952f08076')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  sed -i -e 's/-j3/-j$(nproc)/g' build
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
