# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-vnc
pkgver=0.6.1
pkgrel=1
pkgdesc="This plugin is a VNC viewer that works as a source in OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/vnc-source.1000/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "libvncserver")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("64b652c2b93f37d4d6546bad0e58d9b6e92790716ba41bf3fd8d071a603a3ead")

build() {
  cmake -B build -S "$pkgname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
