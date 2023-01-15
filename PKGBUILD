# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libcalfbox-lss
pkgver=1.2.0
pkgrel=1
pkgdesc="Library for real time midi sequencing and loading of various sampler formats"
arch=(x86_64)
url="https://git.laborejo.org/lss/libcalfbox-lss"
license=(GPL3)
depends=(glibc)
makedepends=(fluidsynth glib2 jack libsndfile meson util-linux)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('66f5784adeb6ce7d4c81e917be1ce64c08b07a2fea7b56598e19ab198c79faa548c0f1cf794a9b0228bb7e63d663867a85a6b2a100320f3ee538e9a92c26d25b'
            'SKIP')
b2sums=('0121edad47c25a1f0b724255a055aca93879247543792749cd7d868ee530892b0e03c9f7d6f74fec1e5882aa0f997e94109d8deb5a574ba73aaa1dd48013cae1'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  arch-meson build $pkgname-$pkgver
  ninja -vC build
}

check() {
  ninja test -vC build
}

package() {
  depends+=(libfluidsynth.so libglib-2.0.so libjack.so libsndfile.so libuuid.so)

  DESTDIR="$pkgdir" meson install -C build
}
