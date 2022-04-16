pkgname=carla-bridges-linux32
pkgver=2.4.3
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
sha512sums=('1e062e2bd5c8791d5936dbaa30accf8165cfb8b487e4b7d90800b573f436a6415d7452000849ebdab60ff60f7162161a0f4f50645deaaf115d47a436807ea3b9')
b2sums=('2fc4cf69b11b88069049eba84a6f3d88d1fbd35539d32dd8d0204de5c146d7bee4eaf6aca40ef3cc366661238eb06dda2a3a3aec93f6c4b6cf4848055076b616')
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
