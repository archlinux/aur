pkgname=ashpd-demo
pkgver=0.11.0
_demo_pkgver=0.5.0
pkgrel=1.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita' 'libshumate')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/bilelmoussaoui/ashpd/releases/download/${_demo_pkgver}-demo/ashpd-demo-${_demo_pkgver}.tar.xz")
sha256sums=('1387915d6bb238aa5d2c658a735f5ee96f99704210e01d96b56ad96024c51215')

build() {
  cd $pkgname-${_demo_pkgver}
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd $pkgname-${_demo_pkgver}
  DESTDIR="$pkgdir" ninja -C build install
}
