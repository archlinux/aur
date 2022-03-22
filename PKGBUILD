# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=fastfetch
pkgver=1.1.0
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
sha256sums=('b9dea6af6e762204f1541fd2a8332d707566a66d59051f3e610cd842590fb43a')

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
