pkgname=polkit-waycrate
pkgver=0.1.1
pkgrel=1.0
pkgdesc='polkit agent waycrate'
arch=('x86_64' 'aarch64')
url='https://github.com/waycrate/polkit-waycrate'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust')
depends=('polkit')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/waycrate/polkit-waycrate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4782a8e4c536d5c93904a49ba8c7f3036d4d08242ebfb56caecbc3993487dd23')
options+=(!lto)

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dlibexecdir=lib \
    -Dbuildtype=release \
    build
  meson compile -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
