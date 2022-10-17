pkgname=carla-bridges-linux32
pkgver=2.5.2
pkgrel=1
pkgdesc="Carla Linux VST 32-Bit Bridge (Stable)"
arch=(x86_64)
url="https://kxstudio.linuxaudio.org/Applications:Carla"
license=(GPL2)
groups=(pro-audio)
depends=(alsa-lib carla gcc-libs glibc lib32-gcc-libs lib32-glibc libglvnd libx11)
makedepends=(file fluidsynth freetype2 git libsndfile liblo libpulse qt5-tools)
provides=(carla-bridges-linux32)
source=("https://github.com/falkTX/Carla/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cfdeeafe3a108a4e6d88d4be0ccb73d4e1677f0eff51375b04bd6a7a081694f91dfd37afa88f4bd0baf02a14f2e2e8214f471273d2b0fe12b63ba36656650e2d')
b2sums=('1a07c9829529fb9bfaeafca508cfa2f96a19f6a78b143a3766b15df951407b05968d3a78ab46595bff0d0352d2e8e03ec7880babb2682628504bead01c45b055')
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0')  # falkTX <falktx@falktx.com>

build() {
  cd "$srcdir/Carla-${pkgver}"
  make -j$(nproc) posix32
}

package() {
  cd "${srcdir}/Carla-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib/carla"
  mkdir -p "${pkgdir}/usr/lib/lv2/carla.lv2"
  mkdir -p "${pkgdir}/usr/lib/vst/carla.vst"
  cp bin/*posix32 "${pkgdir}/usr/lib/carla/"
  cd "${pkgdir}/usr/lib/carla"
  ln -sr *posix32 ../lv2/carla.lv2/
  ln -sr *posix32 ../vst/carla.vst/
}
