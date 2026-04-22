# Maintainer: Kaito Udagawa <umireon at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Contributor: PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval
pkgver=1.3.7
_source="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc='Background removal plugin for OBS studio'
arch=('x86_64')
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL-3.0-or-later')
depends=('curl' 'obs-studio' 'onnxruntime' 'opencv')
makedepends=('cmake' 'ninja')
conflicts=("${pkgname}-git" "${pkgname}-git-debug")
source=("${_source}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0994dd60cb34f132273fb3d0be7db770cdb7c732d08908b584b74b44bc820da1')

build() {
  cd "${_source}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_FRONTEND_API=ON \
    -DENABLE_QT=ON \
    -DUSE_PKGCONFIG=ON \
    -DUSE_SYSTEM_ONNXRUNTIME=ON \
    -GNinja
  cmake --build build
}

package() {
  cd "${_source}"
  cmake --install build --prefix "${pkgdir}/usr"
}
