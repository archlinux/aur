# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lms
pkgver=3.22.0
pkgrel=1
pkgdesc='Lightweight Music Server. Access your self-hosted music using a web interface'
arch=('x86_64')
url='http://lms.demo.poupon.io'
install=lms.install
license=('GPL3')
depends=('ffmpeg'
         'libconfig'
         'taglib'
         'wt')
makedepends=('cmake' 
             'wt'
             'boost'
             'pstreams'
             'graphicsmagick')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/epoupon/lms/archive/v${pkgver}.tar.gz")
sha256sums=('a0fece258aec3f197d6e9f292f9c2496369c452b49df791e3f8ed25012314ac4')

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
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
