# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libcalfbox-lss
pkgver=1.0.0
pkgrel=2
pkgdesc="Library for real time midi sequencing and loading of various sampler formats"
arch=(x86_64)
url="https://git.laborejo.org/lss/libcalfbox-lss"
license=(GPL3)
depends=(glibc)
makedepends=(fluidsynth glib2 jack libsndfile meson util-linux)
options=(debug)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('b81b09d61c5478baf390d533fc5a257f9cf815a21e8eda17513da212505ec986b4af6ac74189b951169dbc3bd4b942796ec4b53285c6571a67cb91cf397628a1'
            'SKIP')
b2sums=('7131202602dce92d638946801829e95a2b997193be582ed6ba9a6cea3a7ca8634ca71e119f58bc1d94f219d8bd3abd609c3543627c8088fab1327162422caa6b'
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
