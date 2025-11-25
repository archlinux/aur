# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=alizams
pkgver=1.9.10
pkgrel=2
pkgdesc="Qt6 DICOM Viewer"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://www.aliza-dicom-viewer.com/"
license=(GPL3)
depends=(qt6-base qt6-5compat insight-toolkit)
makedepends=(git cmake eigen qt6-svg)
source=("git+https://github.com/AlizaMedicalImaging/AlizaMS.git#tag=v${pkgver}")
sha256sums=('b4b0386ab38c6bc64fadcbe46829b9476a1568a996f53c8c6137431e8a49c4f1')

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
