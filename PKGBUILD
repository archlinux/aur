# Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=dosbox-x
pkgver=0.83.11
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg physfs)
makedepends=(glu)
optdepends=('openglide-git: 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)

sha256sums=('d65c96349a921e9843914e5b852ef926e4fff3ae22d9ebd8490b534afec85717')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  sed -i -e 's/-j3/-j$(nproc)/g' build
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
