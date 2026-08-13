# Maintainer: Mike Cuche <mike@cuche.cc>

pkgname=dosbox-x
pkgver=2026.08.02
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg physfs libslirp libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
	ffmpeg9.patch)

sha256sums=('3438f3199dc301d7fdd1ab8ce44877c1755158e699b8deab21a7ad2c43cc0331'
            'e8c7786f078d5cc0eb97b9d21a6e85075f6583b6012eceb1b693df3aab435a28')

prepare() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  patch -p1 -i ../ffmpeg9.patch
}

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  
  sed -i -e 's/-j3/-j$(nproc)/g' build
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
