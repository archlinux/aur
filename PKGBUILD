# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=binauralplayer
_pkgname=BinauralPlayer
pkgver=1.4.0
pkgrel=1
pkgdesc='BinauralPlayer combines traditional media playback with brainwave audio generation'
arch=('x86_64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools' 'vulkan-headers')
provides=('binauralplayer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('096b9b6d22dd902ea51b91e7b46604c84738fe6886abb8355a8eab6a1c89f017')

#prepare() {
#}

build(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
