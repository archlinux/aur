# Maintainer: Jat <chat@jat.email>
# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp
pkgver=0.7.4.3
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
sha512sums=('48808280f05efcc0b811dcb9c3dbdfa2030a478cbae7c6546a421a2fb1e85d3be045938839ecaeaef2e6b5f962265f802c28004d95b20f3a6c91c9962a589361')

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
