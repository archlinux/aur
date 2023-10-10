pkgname=carla-bridges-linux32
pkgver=2.5.7
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
sha512sums=('c634ade64ff8ab66b0c06b17e33ea6fc758837e19156abbfe214d81fc084d96278bc49cb2941ab7328ed4452bb539cde5afa7f16352b18349ffddd1b53a65f3d')
b2sums=('b7ed18f0743caeb3a95d43756ce640ac3bad510979387f720f2bf819143587fc608d0a7e612554e7ef7dd3cccd3353eaa22964dba5cb8f9d3dc5b0310502f9ce')

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
