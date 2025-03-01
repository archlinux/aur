pkgname=utena-launcher
_pkgname=launchre
pkgver=0.4.13
pkgrel=1.0
pkgdesc='launcher make by slint, hope I will get my revolution'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/launchre'
license=('MIT')
depends=('qt6-base')
makedepends=('git' 'ninja' 'meson' 'rust' 'qt6-base')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/launchre/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('521186b9f31e98fa1ee800504d8210a513bf8fbcdcd251e65eef12703943ae3e')
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
