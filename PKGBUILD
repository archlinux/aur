# Maintainer: Jat <chat@jat.email>
# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp
pkgver=0.7.4.5
pkgrel=1
pkgdesc="Multiple RTMP outputs plugin for OBS Studio"
arch=('x86_64')
url="https://github.com/sorayuki/obs-multi-rtmp"
license=('GPL2')

depends=('obs-studio')
makedepends=('cmake' 'ninja' 'pkgconf' 'git' 'qt6-base')
conflicts=('obs-multi-rtmp-bin' 'obs-multi-rtmp-git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/sorayuki/obs-multi-rtmp/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=('aa156cc4b079a25f5cf84ddcbbdb3bd9935012371f455690a1ca68e5bb6727b8106b55f38a2fda5664a6731e3b87e8c351d0ad769e8bf09900f673f819b63cdc')

build() {
  cd "${srcdir}/obs-multi-rtmp-${pkgver}"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_QT=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "${srcdir}/obs-multi-rtmp-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
}
