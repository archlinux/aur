# Maintainer: bbilas <bartosz.bilas at hotmail dot com>

_pkgname=QTasksManager
pkgname=qtasksmanager
pkgver=1.1.2
pkgrel=1
pkgdesc="Graphical work packages manager written in Qt"
arch=('i686' 'x86_64')
url="https://github.com/bbilas/QTasksManager"
license=("GPL3")
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('git' 'cmake')
_pkgver=1.1.2
source=("https://github.com/bbilas/QTasksManager/archive/v${_pkgver}.tar.gz")
sha256sums=('3be90f34f9aee7596de7d4ff102fc7c4f97a08fe32a971cb9799bbecbd82585c')

build() {
  cmake \
      -B "${_pkgname}-${pkgver}/build" \
      -S "${_pkgname}-${pkgver}" \
      -DCMAKE_BUILD_TYPE:STRING='None' \
      -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
      -Wno-dev
  make -C "${_pkgname}-${pkgver}/build"
}

package() {
  make -C "${_pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
