# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-audio-pan-filter
pkgver=0.2.3
pkgrel=1
pkgdesc="This is a simple plugin to control stereo pan of audio source in OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/audio-pan-filter.1042/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake")
options=('debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/norihiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("0aba905f5cf1c9245884e7d8921893fc3e05b8e51de68f411ef83ea425a703c9")

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
