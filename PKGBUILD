pkgname=ashpd-demo
_pkgname=ashpd
pkgver=0.10.0
pkgrel=1.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita' 'libshumate')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/bilelmoussaoui/ashpd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('18cc98084f98e101af8b15dc792bd29f296c4601b547925530aa5a14545e16bf')

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
