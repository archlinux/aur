# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=binauralplayer
_pkgname=BinauralPlayer
pkgver=1.6.2
pkgrel=1
pkgdesc='Binaural Media Player combines traditional media playback with brainwave audio generation'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools' 'vulkan-headers')
optdepends=('pulse-native-provider' 'yt-dlp: to play audio directly from HTTP/HTTPS URLs')
provides=('binauralplayer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"binauralplayer.install")
sha256sums=('43b74dc9a3e6530f14895ec707702eb7d9f5a014678ca3971c7509d2e0cc5e4f'
	    'a173edb9fcbe16260bc7174cff84e91defb686ecbb8f8fa0389da63825c96c37')
install="binauralplayer.install"

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
