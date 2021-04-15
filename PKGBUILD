# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
pkgver=2.11.1
pkgrel=1
pkgdesc='Intel VA-API Media Applications and Scripts for headless libva'
arch=('x86_64')
url='https://github.com/intel/libva-utils'
license=('custom')
depends=('libva-headless')
makedepends=('meson')
conflicts=('libva-utils')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0c1eb7f717e391d00da74c53a9fe5caf3d6c510dcd35bac7f71a0e59ad1b8d26')

build() {
  arch-meson "libva-utils-${pkgver}" "libva-utils-${pkgver}.build" -Ddrm=true -Dx11=false -Dwayland=false
  ninja -C "libva-utils-${pkgver}.build"
}

package() {
  DESTDIR="${pkgdir}" meson install -C "libva-utils-${pkgver}.build"

  install -Dm644 "libva-utils-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva-utils/COPYING
}
