# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=antimicrox-git
pkgver=3.1.3.r16.gf27aa8d0
pkgrel=1
pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad. Antimicro fork'
url="https://github.com/AntiMicroX/antimicroX"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(libxtst hicolor-icon-theme sdl2 qt5-x11extras)
makedepends=(git cmake qt5-tools itstool extra-cmake-modules)
conflicts=(antimicrox)
provides=(antimicrox)
source=("git+https://github.com/AntiMicroX/antimicroX.git")
sha256sums=('SKIP')

pkgver() {
  cd antimicroX
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S antimicroX \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_X11=ON \
    -DWITH_XTEST=ON \
    -DWITH_UINPUT=OFF \
    -DAPPDATA=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
