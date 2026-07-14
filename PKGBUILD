# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=ermis
_pkgname=Ermis
pkgver=1.1.2
pkgrel=1
pkgdesc='Image, Audio, Text, PDF, Distributed and Network Steganography Suite.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('04b05cbb6cd200590c24c620d78b32efdfaf3321080f3420dea066004b63732a')

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
