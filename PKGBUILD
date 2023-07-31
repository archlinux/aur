# Maintainer: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Previously contributed by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval

pkgver=1.1.3
pkgrel=1
pkgdesc='Background removal plugin for OBS studio'
_source="${pkgname}-${pkgver}"

arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL2')
depends=('obs-studio' 'opencv' 'curl')
makedepends=('cmake')
source=("${_source}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a3bcca2ad66f86d4d0b793895f517b1b5ffc7046655ca17baf3859d7a79fc75c')

build() {
  cd "$_source"
  cmake -B build --preset linux-x86_64 -DLINUX_PORTABLE=OFF -DUSE_SYSTEM_OPENCV=ON -DUSE_SYSTEM_CURL=ON
  cmake --build build
}

package() {
  cd "$_source"
  cmake --install build --prefix "$pkgdir/usr"
}
