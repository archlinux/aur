# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-kwin-reborn
_pkgname=deepin-kwin
pkgver=5.24.3
_tag=4%255.24.3-deepin.1.8
pkgrel=1
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64)
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils breeze
         pipewire-session-manager libqaccessibilityclient lcms2 libxcvt)
makedepends=(extra-cmake-modules qt5-tools kdoctools deepin-wayland-protocols python ninja)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/justforlxz/deepin-kwin/archive/refs/tags/$_tag.tar.gz")
install=$_pkgname.install
sha256sums=('725239b2f01d78e8ef51ae22eb8856d2344f110a150ad3f253d51bc1faa7643b')
options=(debug)

build() {
  cmake -G Ninja -B build -S $_pkgname-4-$pkgver-deepin.1.8 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKWIN_BUILD_KCMS=OFF \
    -DKWIN_BUILD_TABBOX=ON \
    -DKWIN_BUILD_CMS=OFF \
    -DKWIN_BUILD_RUNNERS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
