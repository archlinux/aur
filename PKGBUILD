pkgname=carla-bridges-linux32
pkgver=2.5.0
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
sha512sums=('ea263719ec9903e89d9713cb0742dd432d04de62d8d93a4801b42a544f4b7f1b702f10b51cc2ec369cbd2982f2a732e2a26b93e4a6066be96dc91b1a861ce69d')
b2sums=('75db562048be2ae7fa9c01602cc4939ea5793b231a5f6bcab4acc475bce60f1faf7d6e950b3022fa87df9fec039a5106f926cf1ec4a966893d4526c783256b6b')
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
