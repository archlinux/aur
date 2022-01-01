# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=alizams
pkgver=1.7.4
pkgrel=1
pkgdesc="Qt6 DICOM Viewer"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://www.aliza-dicom-viewer.com/"
license=(GPL3)
depends=(qt6-base qt6-5compat insight-toolkit)
makedepends=(git cmake qt6-svg)
source=("git+https://github.com/AlizaMedicalImaging/AlizaMS.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd AlizaMS
  [[ -d build ]] || mkdir build
}

build() {
  cd AlizaMS/build
  cmake .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DALIZA_QT_VERSION:STRING=6 \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd AlizaMS/build
  make DESTDIR="$pkgdir/" install
}
