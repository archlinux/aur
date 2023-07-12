# Maintainer: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Previously contributed by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval

pkgver=1.1.0
pkgrel=1
pkgdesc='Background removal plugin for OBS studio'
_source="${pkgname}-${pkgver}"

arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL2')
depends=('obs-studio' 'opencv' 'curl')
makedepends=('cmake')
source=("${_source}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4110778c6bbb7fd247c44d36b71ce6441340872f2efb295208f32ea30d2eb586')

build() {
  cd "$_source"
  cmake -B build --preset linux-x86_64 -DLINUX_PORTABLE=OFF -DUSE_SYSTEM_OPENCV=ON -DUSE_SYSTEM_CURL=ON
  cmake --build build
}

package() {
  cd "$_source"
  cmake --install build --prefix "$pkgdir/usr"
}
