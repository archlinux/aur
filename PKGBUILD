pkgname=carla-bridges-linux32
pkgver=6939.66afe24a0
pkgrel=2
pkgdesc="Carla Linux VST 32-Bit Bridge"
arch=(x86_64)
url="https://kxstudio.linuxaudio.org/Applications:Carla"
license=(GPL2)
groups=('pro-audio')
depends=('carla')
makedepends=("git" "gcc-multilib")
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
