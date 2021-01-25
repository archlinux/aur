# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
pkgver=2.10.0
pkgrel=2
pkgdesc='Intel VA-API Media Applications and Scripts for headless libva'
arch=('x86_64')
url='https://github.com/intel/libva-utils'
license=('custom')
depends=('libva-headless')
makedepends=('meson')
conflicts=('libva-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cbb7f9f6eae21d772e31b67bc8c311be6e35fe9c65e63acc57f9b16d72bf8dc0')

build() {
  arch-meson "libva-utils-${pkgver}" build -Ddrm=true -Dx11=false -Dwayland=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "libva-utils-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva-utils/COPYING
}
