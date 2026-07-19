# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=ermis
_pkgname=Ermis
pkgver=1.1.3
pkgrel=1
pkgdesc='Image, audio, text, PDF, distributed and network steganography suite.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'miniupnpc')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01d474508f67f35834ffc32415703b8ddb52d93459a615974041495810bef5ff')

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
