# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-vban
pkgver=0.3.0
pkgrel=1
pkgdesc="This plugin provides audio sources from VBAN, audio over UDP protocol"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/vban-audio-plugin.1623/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("f251a8b404ca38e387d096375810a87caca4f5f45604749adc2566158cae0fc0")

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=None \
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
