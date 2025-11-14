# Maintainer: Kaito Udagawa <umireon at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Contributor: PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval
pkgver=1.3.3
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
sha256sums=('9280c7560ef2c5d38a2d786413ae4a23486c91262aacbd55258bf436a154c753')

build() {
  cd "${_source}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_FRONTEND_API=ON \
    -DENABLE_QT=ON \
    -DUSE_PKGCONFIG=ON \
    -GNinja
  cmake --build build
}

package() {
  cd "${_source}"
  cmake --install build --prefix "${pkgdir}/usr"
}
