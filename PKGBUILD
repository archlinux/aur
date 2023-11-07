pkgname=kwinft
pkgver=5.27
pkgrel=2
pkgdesc='Wayland compositor and X11 window manager'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/kwinft"
license=(LGPL)
depends=(breeze kdisplay-kwinft kinit kscreenlocker plasma-framework5 python qt5-script wrapland xcb-util-cursor wayland xorg-xwayland wlroots kdecoration)
makedepends=(extra-cmake-modules git qt6-tools kdoctools5)
optdepends=('qt6-virtualkeyboard: virtual keyboard support for kwin-wayland')
provides=("kwin")
conflicts=("kwin")
source=("git+https://gitlab.com/kwinft/kwinft.git")
sha256sums=('SKIP')
install=kwinft.install

prepare() {
  cd kwinft
  git checkout Plasma/$pkgver
}

build() {
  mkdir -p build
  cd build
  cmake ../kwinft \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}


package() {
  cd build
  make DESTDIR="$pkgdir" install
}
