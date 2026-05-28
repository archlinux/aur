# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=selene-p2p
_pkgname=Selene
pkgver=1.0.7
pkgrel=1
pkgdesc='Selene is a Tor-based P2P chat and encrypted file sharing'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'hicolor-icon-theme' 'tor')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d425c2e7cee682185db0a93f82b0045c37d574f5e50d3226f18cd65acdd521f2')

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
