pkgname=ashpd-demo
_pkgname=ashpd
pkgver=0.12.0
pkgrel=1.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita' 'libshumate')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/bilelmoussaoui/ashpd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('554cef0e282bbf240d78490e7db7df8ccf7c5e4e16589343d815bb0e59de2b9a')

build() {
  cd ${_pkgname}-${pkgver}/ashpd-demo
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${_pkgname}-${pkgver}/ashpd-demo
  DESTDIR="$pkgdir" ninja -C build install
}
