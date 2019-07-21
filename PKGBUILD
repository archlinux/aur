# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
pkgver=2.5.0
pkgrel=1
pkgdesc='Intel VA-API Media Applications and Scripts for headless libva'
arch=('x86_64')
url='https://github.com/intel/libva-utils'
license=('custom')
depends=('libva-headless')
makedepends=('meson')
conflicts=('libva-utils')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d6c37257933731c7936775376388dfe6c9ebc460adff29f9ffe74cde2ebb3f52')

build() {
  arch-meson "libva-utils-${pkgver}" build -Ddrm=true -Dx11=false -Dwayland=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "libva-utils-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva-utils/COPYING
}
