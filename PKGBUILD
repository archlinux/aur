# Maintainer: bbilas <bartosz.bilas at hotmail dot com>

_pkgname=QTasksManager
pkgname=qtasksmanager
pkgver=2.0.0
pkgrel=1
pkgdesc="Graphical work packages manager written in Qt"
arch=('i686' 'x86_64')
url="https://github.com/bbilas/QTasksManager"
license=("GPL3")
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/bbilas/QTasksManager/archive/v${pkgver}.tar.gz")
sha256sums=('1e7ff40fa73da1547d18bcdd633ac304d2478635a546e099cba48146d825f8af')

build() {
  cmake \
      -B "${_pkgname}-${pkgver}/build" \
      -S "${_pkgname}-${pkgver}" \
      -DCMAKE_BUILD_TYPE:STRING='None' \
      -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
      -Wno-dev
  cmake --build "${_pkgname}-${pkgver}/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "${_pkgname}-${pkgver}/build"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
