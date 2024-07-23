pkgname=marine_greetd
_pkgname=marine_greetdm
pkgver=0.4.0
pkgrel=1.0
pkgdesc='A simple cli login dm just for wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/marine_greetdm'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
dependends=('greetd')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/marine_greetdm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f66fe1ed3961f225ff535fc3800a07f329b92fdc873063d2d200261779ae391c')

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
