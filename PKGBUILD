# Maintainer: Vadim Kaushan <admin@disasm.info>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lms
pkgver=3.41.0
pkgrel=1
pkgdesc='Lightweight Music Server. Access your self-hosted music using a web interface'
arch=('x86_64')
url='https://github.com/epoupon/lms'
install=lms.install
license=('GPL3')
depends=('ffmpeg'
         'libconfig'
         'taglib'
         'wt')
makedepends=('cmake' 
             'wt'
             'boost'
             'gtest'
             'graphicsmagick')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/epoupon/lms/archive/v${pkgver}.tar.gz")
sha256sums=('8af72b77dbd3445fa5cb63bcfd03e276382addd0234b03e797dc56895d35405f')

build() {
  mkdir "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make 
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}/usr/share/lms/lms.conf" -t "${pkgdir}/etc/"
  install -Dm644 "${pkgdir}/usr/share/lms/default.service" "${pkgdir}/usr/lib/systemd/system/lms.service"  
}
# vim:set ts=2 sw=2 et:
