# Maintainer: tytan652 <tytan652@tytanium.xyz>

_reponame=obs-ptz
pkgname=$_reponame-controls
pkgver=0.15.2
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a PTZ Camera control dock"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/ptz-controls.1284/"
license=("GPL2")
depends=("obs-studio>=28" "qt6-serialport") # "qt5-gamepad"
makedepends=("cmake")
options=('debug')
source=("$_reponame::git+https://github.com/glikely/$_reponame.git#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cd $_reponame

  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd $_reponame

  make -C build DESTDIR="$pkgdir/" install
}
