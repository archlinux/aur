# Maintainer: Nora Amita <qiangtianxing@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=rclone-browser-qt6
pkgver=1.9.0
pkgrel=4
pkgdesc="Simple cross-platform GUI for rclone"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://github.com/kRHYME7/RcloneBrowser"
license=(MIT)
depends=(qt6-base rclone)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kRHYME7/RcloneBrowser/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b5f0afa7fdfe438febe5e4f7e5959ba7cba926edd28821689985cd68a061b47')
provides=(rclone-browser)
conflicts=(rclone-browser rclone-browser-git)

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
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None
}

package() {
  cd "${srcdir}/RcloneBrowser-${pkgver}/build"
  cmake --build . --target install
  install -Dm644 "${srcdir}"/RcloneBrowser-${pkgver}/LICENSE \
                 "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
