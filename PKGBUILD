# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-vban
pkgver=0.2.3
pkgrel=1
pkgdesc="This plugin provides audio sources from VBAN, audio over UDP protocol"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/vban-audio-plugin.1623/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("975c9c7653de229d3bb8cb1ed1a6de7095bcdf6d31bcfe395d26fef91d38eb80")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
