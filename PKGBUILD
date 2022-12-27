# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-kwin-git
pkgver=v5.15.4.r4204.g567199313
pkgrel=1
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64)
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils breeze
         pipewire-session-manager libqaccessibilityclient lcms2 libxcvt)
makedepends=(extra-cmake-modules
	     wayland-protocols
	     qt5-tools
	     kdoctools
	     dwayland-git
	     deepin-wayland-protocols-git
	     dde-kwin-git
	     python
	     ninja)
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-kwin")
install=deepin-kwin.install
sha256sums=('SKIP')
options=(debug)

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -G Ninja -B build -S $pkgname \
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

