# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-websocket-compat
pkgver=4.9.1
pkgrel=1
pkgdesc="Remote-control of OBS Studio through WebSocket (4.9.1 backwards-compatible)"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/obs-websocket/tree/4.x-compat-new-cmake"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git" "asio" "nlohmann-json" "websocketpp")
options=('debug')
source=("$pkgname::git+https://github.com/obsproject/obs-websocket.git#commit=f7451d82a6b8c82dcf4a94d9b2d80d79ac85542e")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
