# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=binauralplayer
_pkgname=BinauralPlayer
pkgver=1.4.0
pkgrel=2
pkgdesc='BinauralPlayer combines traditional media playback with brainwave audio generation'
arch=('i686' 'x86_64' 'aarch64')
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
  
  #warning about the program requiring PulseAudio:
  echo ""
  echo "Please note:" 
  echo "BinauralPlayer requires PulseAudio for sound output."
  echo "If you don't want to use PulseAudio, you can always use a PulseAudio emulation (such as apulse) without ever running PulseAudio server"
  echo "(this is why PulseAudio wasn't specified as a dependency)."
  echo ""
}
