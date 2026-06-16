# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=i-ching-diviner
_pkgname=IChingDiviner
pkgver=1.0.4
pkgrel=1
pkgdesc='I Ching oracle with AI interpretations of hexagrams.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('446effd6d0ac20f8ba5c7b682217405ad985e3f5ea7b2f4b88edbaca97ab9dc0')


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
