# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-command-source
pkgver=0.5.0
pkgrel=1
pkgdesc="This plugin provides a dummy source to execute arbitrary command when scene is switched"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dummy-source-to-execute-command.952/"
license=(GPL-2.0-or-later)
depends=("glibc"  "obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("866e14c8f9666b2c662797058f912c7cd70315b16acb7416a7dd3af15e42a836")

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
