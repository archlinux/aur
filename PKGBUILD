# Maintainer: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Previously contributed by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval

pkgver=0.5.17
pkgrel=1
pkgdesc='Background removal plugin for OBS studio (precompiled onnxruntime)'
_source="${pkgname}-${pkgver}"

arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('MIT custom')
depends=('obs-studio' 'opencv')
makedepends=('cmake')
source=("${_source}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7e44c352f2b1d082f7904fea4773caadf52cc666e8c64ed954a69a57c31c855b')

build() {
  cd "$_source"
  cmake -B build -DLINUX_PORTABLE=OFF -DUSE_SYSTEM_OPENCV=ON
  cmake --build build
}

package() {
  cd "$_source"
  cmake --install build --prefix "$pkgdir/usr"
  install -Dt "$pkgdir/usr/share/licenses/obs-backgroundremoval" "LICENSE"
}
