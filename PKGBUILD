# Maintainer: Mike Cuche <mike@cuche.cc>

pkgname=dosbox-x
pkgver=2025.10.07
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64 aarch64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg physfs libslirp libpcap)
makedepends=(glu)
optdepends=('openglide-git: Third-party 3dfx Glide API support')
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz)

sha256sums=('fed630dba74f1ad1552bc5ec94cb68f70737e67a7ca1768f6071b255426ce117')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  
  #Workaround: https://github.com/joncampbell123/dosbox-x/issues/4436
  #export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
  #  -Wp,-D_FORTIFY_SOURCE=2 -Wformat \
  #  -fstack-clash-protection -fcf-protection"
  #export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"

  sed -i -e 's/-j3/-j$(nproc)/g' build
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
}
