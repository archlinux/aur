# Maintainer: Jat <chat@jat.email>
# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp
pkgver=0.7.3.2
pkgrel=3
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
sha512sums=('62c820e94e244efe3f1e98551c1caf4c0c54f0bb8c821965e896bf04dee0334c2eee126c5857b1793e35dcd6bb164c8cc711c6e0e520d51545d80615a99014cc')

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
