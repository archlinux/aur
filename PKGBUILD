# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-vnc
pkgver=0.6.2
pkgrel=1
pkgdesc="This plugin is a VNC viewer that works as a source in OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/vnc-source.1000/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "libvncserver")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("cd6b3241454402593e3d2255dea01b0553dc9c540381c080135f24ea3ed7d09e")

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
