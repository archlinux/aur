# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-kwin-reborn
_pkgname=deepin-kwin
_tag=dev
pkgver=5.24.3
pkgrel=3
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64)
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils breeze
         pipewire-session-manager libqaccessibilityclient lcms2 libxcvt)
makedepends=(extra-cmake-modules
	     wayland-protocols
	     qt5-tools
	     kdoctools
	     dwayland-reborn
	     deepin-wayland-protocols-reborn
	     dde-kwin-reborn
	     python
	     ninja)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/justforlxz/deepin-kwin/archive/$_tag.tar.gz")
install=$_pkgname.install
sha256sums=('SKIP')
options=(debug)

build() {
  cmake -G Ninja -B build -S $_pkgname-$_tag \
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
