# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=binauralplayer
_pkgname=BinauralPlayer
pkgver=1.5.3
pkgrel=1
pkgdesc='BinauralPlayer combines traditional media playback with brainwave audio generation'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools' 'vulkan-headers')
provides=('binauralplayer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbc300d072ae02062048675294d777162f3b6f0cc5476cd01462c881f3cac8e9')

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
  echo "If you don't want to use PulseAudio, you can always use a PulseAudio emulation (such as apulse) without ever running a PulseAudio server"
  echo "(this is why PulseAudio wasn't specified as a dependency)."
  echo ""
}
