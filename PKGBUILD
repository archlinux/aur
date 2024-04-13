# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=libnpy
pkgver=1.0.1
pkgrel=1
pkgdesc="C++ library for reading and writing of numpy's .npy files"
url="https://github.com/llohse/${pkgname}"
arch=(any)
license=(MIT)
depends=()
makedepends=(meson)
checkdepends=(cmake catch2-v2 python-numpy)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('faeff4f620025f1f5358498dcfb2eed97aa27ece2a9ee323d177d1dce149d029e0cb0d4a9b5b356027c651ab591e7bd75aa09b6c079b851c27444183e95ff16b')

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

check() {
  cd ${pkgname}-${pkgver}
  arch-meson tests builddir
  meson compile -C builddir
  meson test -C builddir --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
