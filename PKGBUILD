pkgname=kwinft
pkgver=5.26.5.r21667.gf4bd30d37
pkgrel=1
pkgdesc='Wayland compositor and X11 window manager'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/kwinft"
license=(LGPL)
depends=(breeze kdisplay-kwinft kinit kscreenlocker plasma-framework python qt5-script wrapland xcb-util-cursor wayland xorg-xwayland wlroots kdecoration-kwinft)
makedepends=(extra-cmake-modules git qt5-tools kdoctools)
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
provides=("kwin")
conflicts=("kwin")
source=("git+https://gitlab.com/kwinft/kwinft.git")
sha256sums=('SKIP')
install=kwinft.install

pkgver() {
  _ver=5.26.5
  cd kwinft
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
#  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
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
