# Maintainer: popolon <popolon @ popolon dot org>

pkgname=fastgltf
pkgver=0.9.0
pkgrel=1
pkgdesc=''
arch=($CARCH)
url='https://fastgltf.readthedocs.io/'
license=('MIT')
#depends=('mesa')
makedepends=('cmake' 'catch2' 'glad' 'glfw' 'glm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/spnda/fastgltf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0bb564e127b14c22f062db50f89381dd2e0a20dbaf4987ca138a4ae8728712f9')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
	-DFASTGLTF_ENABLE_DOCS=ON \
	-DFASTGLTF_ENABLE_EXAMPLES=ON \
	-DFASTGLTF_ENABLE_KHR_PHYSICS_RIGID_BODIES=ON
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
  install -Dm644 ../LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
