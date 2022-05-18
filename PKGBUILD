# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=rclone-browser
pkgver=1.8.0
pkgrel=3
pkgdesc="Simple cross-platform GUI for rclone"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://github.com/kapitainsky/RcloneBrowser"
license=(MIT)
depends=(qt5-base rclone)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kapitainsky/RcloneBrowser/archive/${pkgver}.tar.gz")
sha256sums=('5f8242a011b85477749127b7e94e874035c431c2fa6df817e5603ed891604beb')

export CFLAGS+=" -Wno-deprecated-declarations"
export CXXFLAGS="${CFLAGS}"

prepare() {
  cd "${srcdir}/RcloneBrowser-${pkgver}"
  #sed -i 's/ -Werror//g' src/CMakeLists.txt
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/RcloneBrowser-${pkgver}/build"
  cmake .. -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_BUILD_TYPE=None
}

package() {
  cd "${srcdir}/RcloneBrowser-${pkgver}/build"
  cmake --build . --target install
  install -Dm644 "${srcdir}"/RcloneBrowser-${pkgver}/LICENSE \
                 "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
