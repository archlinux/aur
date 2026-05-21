# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=ermis
_pkgname=Ermis
pkgver=1.1.1
pkgrel=1
pkgdesc='Image, Audio, Text, PDF, Distributed and Network Steganography Suite.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da78a2ab7f55bb52add3fee1fd7f96394e69401e7d580b2c75dca8ef4e6a0d7d')

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
