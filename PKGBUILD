pkgname=marine_greetd
_pkgname=marine_greetdm
pkgver=0.3.2
pkgrel=1.0
pkgdesc='A simple cli login dm just for wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/marine_greetdm'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
dependends=('greetd')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/marine_greetdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89574324673b42594316cd751c80a9f0e76b0104547374eb8802b9f2026246b0')

build() {
  cd ${_pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${_pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
