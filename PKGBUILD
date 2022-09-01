# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=scrab
pkgname=obs-$_pluginname
pkgver=1.2.0
pkgrel=1
pkgdesc="Adds a configurable hotkey to quickly select a screen region and add it as an image source to the current scene"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scrab.845/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/univrsal/$_pluginname/archive/v$pkgver.tar.gz")
sha256sums=("4395c2020b4adbeeb5357827a3fdf9437df1ae8f6957ef78fa15afbb07b409c3")

build() {
  cd "$_pluginname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$_pluginname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
