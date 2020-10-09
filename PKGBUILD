# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
pkgver=2.9.0
pkgrel=1
pkgdesc='Intel VA-API Media Applications and Scripts for headless libva'
arch=('x86_64')
url='https://github.com/intel/libva-utils'
license=('custom')
depends=('libva-headless')
makedepends=('meson')
conflicts=('libva-utils')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d363210a42cd2667f6f7cff0e57db1d527feb067ffebe3ba233bc80b1bdcd9b4')

build() {
  arch-meson "libva-utils-${pkgver}" build -Ddrm=true -Dx11=false -Dwayland=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "libva-utils-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva-utils/COPYING
}
