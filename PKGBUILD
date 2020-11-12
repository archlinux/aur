# Maintainer: bbilas <bartosz.bilas at hotmail dot com>

pkgname=qtasksmanager
pkgver=14f9f911f66caa95e024c491fede06da2517e9a2
pkgrel=1
pkgdesc="Graphical work packages manager written in Qt"
arch=('i686' 'x86_64')
url="https://github.com/bbilas/QTasksManager"
license=("GPL3")
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('git' 'cmake')
_pkgver=14f9f911f66caa95e024c491fede06da2517e9a2
source=("${pkgname}-${pkgver}::git+https://github.com/bbilas/QTasksManager.git")
sha256sums=('SKIP')

build() {
  cmake \
      -B "${pkgname}-${pkgver}/build" \
      -S "${pkgname}-${pkgver}" \
      -DCMAKE_BUILD_TYPE:STRING='None' \
      -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
      -Wno-dev
  make -C "${pkgname}-${pkgver}/build"
}

package() {
  make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
