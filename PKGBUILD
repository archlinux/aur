pkgname=utena-launcher
_pkgname=launchre
pkgver=0.4.12
pkgrel=1.0
pkgdesc='launcher make by slint, hope I will get my revolution'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/launchre'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'qt5-base')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/launchre/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2279bcfed2db217a39da21bdb02d77832d9d2b1b57fafb0b6e9579a0f9a3fc36')
options+=(!lto)

build() {
  cd ${_pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  meson compile -C build
}

package() {
  cd ${_pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
