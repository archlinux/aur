# Maintainer: nesk_aur
pkgname=android-file-transfer-cli
pkgver=4.5
pkgrel=1
pkgdesc='An interactive MTP client - CLI only, no QT/fuse dependencies'
arch=(x86_64 aarch64)
url='https://github.com/whoozle/android-file-transfer-linux'
license=(GPL3)
depends=(libxkbcommon-x11 hicolor-icon-theme file android-udev)
makedepends=(cmake)
conflicts=(android-file-transfer-cli android-file-transfer-git)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/whoozle/android-file-transfer-linux/archive/v${pkgver}.tar.gz)
sha256sums=('d8225cad6eb2e120afd4c82232030d74fd480e666a0fcc4ab93f4cd57620f7c8')

build() {
  cd android-file-transfer-linux-$pkgver
  env CMAKE_GENERATOR="Unix Makefiles" cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_QT_UI=OFF \
		-D BUILD_FUSE=OFF \
		-D BUILD_MTPZ=OFF \
		-D BUILD_PYTHON=OFF \
		-D BUILD_TAGLIB=OFF \
		.
  make
}

package() {
  cd ${pkgname}-linux-$pkgver
  make DESTDIR="$pkgdir/" install
}
