pkgname=kwinft
_pkgname=theseus-ship
pkgver=6.0.0
pkgrel=1
pkgdesc='theseus-ship: Wayland and X11 Compositor for the KDE Plasma desktop formerly named kwinft'
arch=(x86_64 aarch64)
url="https://github.com/winft/theseus-ship"
license=(LGPL)
depends=(breeze kscreenlocker libplasma python qt6-tools xcb-util-cursor wayland xorg-xwayland wlroots kdecoration 'como')
makedepends=(extra-cmake-modules git kdoctools)
optdepends=('qt6-virtualkeyboard: virtual keyboard support for kwin-wayland' 'qt6-tools')
source=("https://github.com/winft/theseus-ship/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ffd8cf6c0b48cda918a74df372c55f42e00c9151420b4148b5e9f67ae05a05d5')
install=kwinft.install

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../v$pkgver.tar.gz --strip-components=1
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
