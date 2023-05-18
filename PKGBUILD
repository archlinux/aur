# Maintainer: tytan652 <tytan652@tytanium.xyz>

_reponame=obs-ptz
pkgname=$_reponame-controls
pkgver=0.15.4
pkgrel=2
pkgdesc="Plugin for OBS Studio to add a PTZ Camera control dock"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/ptz-controls.1284/"
license=("GPL2")
depends=("obs-studio>=28" "gcc-libs" "glibc" "qt6-base" "qt6-serialport")
makedepends=("cmake" "git")
options=('debug')
source=("$_reponame::git+https://github.com/glikely/$_reponame.git#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cmake -B build -S $_reponame \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
