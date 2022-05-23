# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=fastfetch
pkgver=1.4.1
pkgrel=1
pkgdesc="Like Neofetch, but much faster because written in C"
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
depends=('bash')
makedepends=('chafa' 'cmake' 'dbus' 'dconf' 'imagemagick' 'pciutils' 'libxcb' 'libxrandr'
             'vulkan-headers' 'vulkan-icd-loader' 'wayland' 'xfconf' 'zlib')
optdepends=(
  'chafa: Image output as ascii art'
  'dbus: Needed for detecting current media player and song'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libxrandr: Multi monitor support'
  'pciutils: GPU output'
  'vulkan-icd-loader: Fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('16ee44125bbe769c5c3d529c63c063a817e88bdde21164fa06b756f2c2345599')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_IMAGEMAGICK6='OFF' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
