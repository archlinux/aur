# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=fastfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Like Neofetch, but much faster because written in C"
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
depends=('bash')
makedepends=('cmake' 'dbus' 'dconf' 'pciutils' 'libxcb' 'libxrandr'
             'vulkan-headers' 'vulkan-icd-loader' 'wayland' 'xfconf')
optdepends=(
  'dbus: Needed for detecting current media player and song'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'glib2: Output for values that are only stored in GSettings'
  'libxrandr: Multi monitor support'
  'pciutils: GPU output'
  'vulkan-icd-loader: Fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('316a6a86a7fcd5e521f10da1b4b766f964252d3a8324c77a80696c78cf5d6c01')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build --target "$pkgname"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
