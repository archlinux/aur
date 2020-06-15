# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
pkgver=2.7.1
pkgrel=1
pkgdesc='Intel VA-API Media Applications and Scripts for headless libva'
arch=('x86_64')
url='https://github.com/intel/libva-utils'
license=('custom')
depends=('libva-headless')
makedepends=('meson')
conflicts=('libva-utils')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('9cf35b971001e7143dda14207b6891c12619a72a2ab99a9133b3da5b9c4d97dd')

build() {
  arch-meson "libva-utils-${pkgver}" build -Ddrm=true -Dx11=false -Dwayland=false
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 "libva-utils-${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/libva-utils/COPYING
}
