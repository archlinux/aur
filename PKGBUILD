pkgname=carla-bridges-linux32
pkgver=2.4.2
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
sha512sums=('70b53ed681565a59398b3626c5aff2ccd46c6fe55c6f22796408d0b851620e6f0a502b6122df10a189d7706ca9baf471bbc735c14eacf610f3257ec0409eae65')
b2sums=('600e0d640cea1781f3288f5a92058e2417021b6831df78264d0f6b2a9546e19d3ecb175482a95655efa3cf3b26f98f456f459cda91ca976913c0fa3eab3b0a2e')
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
