pkgname=carla-bridges-linux32-git
pkgver=6921.84e2e0a4b
pkgrel=1
pkgdesc="Carla Linux VST 32-Bit Bridge (Git)"
arch=(x86_64)
url="https://kxstudio.linuxaudio.org/Applications:Carla"
license=(GPL2)
groups=(pro-audio)
depends=(alsa-lib carla gcc-libs glibc lib32-gcc-libs lib32-glibc libglvnd libx11)
makedepends=(file fluidsynth freetype2 git libsndfile liblo libpulse qt5-tools)
provides=(carla-bridges-linux32)
source=("$pkgname"::'git+https://github.com/falkTX/Carla.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make -j$(nproc) posix32
}

package() {
  cd "${srcdir}/$pkgname"
  mkdir -p "${pkgdir}/usr/lib/carla"
  mkdir -p "${pkgdir}/usr/lib/lv2/carla.lv2"
  mkdir -p "${pkgdir}/usr/lib/vst/carla.vst"
  cp bin/*posix32 "${pkgdir}/usr/lib/carla/"
  cd "${pkgdir}/usr/lib/carla"
  ln -sr *posix32 ../lv2/carla.lv2/
  ln -sr *posix32 ../vst/carla.vst/
}
