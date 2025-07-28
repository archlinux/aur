# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=android-file-transfer-cli
pkgver=4.5
pkgrel=2
pkgdesc='An interactive MTP client - CLI only, no QT/fuse dependencies'
arch=(x86_64 aarch64)
url='https://github.com/whoozle/android-file-transfer-linux'
license=(LGPL-2.1-or-later)
depends=(file android-udev)
makedepends=(cmake)
conflicts=(android-file-transfer android-file-transfer-git)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/whoozle/${pkgname%-cli}-linux/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('0f366a8d659926d3859a8628d4f7592692389b060f67da9a936d19b252b42d96')
build() {
  cd android-file-transfer-linux-$pkgver
  env CMAKE_GENERATOR="Unix Makefiles" cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_QT_UI=OFF \
		-D BUILD_FUSE=OFF \
		-D BUILD_MTPZ=OFF \
		-D BUILD_PYTHON=OFF \
		-D BUILD_TAGLIB=OFF \
		.
  make -j $(nproc)
}
package() {
  cd ${pkgname%-cli}-linux-$pkgver
  make DESTDIR="$pkgdir/" install
}
