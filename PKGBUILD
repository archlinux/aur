pkgname=utena-launcher
_pkgname=launchre
pkgver=0.4.4
pkgrel=1.0
pkgdesc='launcher make by slint, hope I will get my revolution'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/launchre'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/launchre/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e053cfa35e3f1bf569190016b977fca7d6da7008dc9d9a9e3c843ee6c5fd132')

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
