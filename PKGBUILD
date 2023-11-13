pkgname=utena-launcher
_pkgname=launchre
pkgver=0.4.6
pkgrel=1.0
pkgdesc='launcher make by slint, hope I will get my revolution'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/launchre'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/launchre/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('348f907228325e6a60895c1555733f4d8327b9b224d92ea25f7109456a0b3427')

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
