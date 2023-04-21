pkgname=utena-launcher
_pkgname=launchre
pkgver=0.3.8
pkgrel=1.0
pkgdesc='launcher make by slint, hope I will get my revolution'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/launchre'
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/launchre/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('540dac4289ff456d980aba35e6c133a1d2a32c7da7bf9a76e64f8252655e7887')

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
