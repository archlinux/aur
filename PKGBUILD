# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=jasmine
_pkgname=Jasmine
pkgver=1.3.2
pkgrel=1
pkgdesc='Website launcher and session management platform with profiles for each tab plus Internet radio, IPTV and podcasts support.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6904d61029bcafb4ae76f20cb4cf07be27eed6ddadd01b1a84b3f8b25f45f498')


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
