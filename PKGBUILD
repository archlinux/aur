# Maintainer: Jat <chat@jat.email>
# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp
pkgver=0.7.4.4
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
sha512sums=('c99682a16eccdf5fac792ef60dcee8c2fe5808ef1c0deeffe3e88dec0dc5d8937e0115ed982522fefec348b43a361c8476f907f60c79c111ee7b181ff8b193b7')

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
