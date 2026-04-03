# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=tarotcaster
_pkgname=TarotCaster
pkgver=1.2.2
pkgrel=2
pkgdesc='Tarot Casting Application with AI Interpretation of Spreads'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
#conflicts=('')
#provides=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50342ac543fc5b89c002cd4d36012e28f72e918c02934b79f56563e7dfb4f042')


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
