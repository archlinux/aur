# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-scene-notes-dock
pkgver=0.1.1
pkgrel=2
pkgdesc="Plugin for OBS Studio allowing you to create a Dock for showing and editing notes for the current active scene"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scene-notes-dock.1398/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
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
