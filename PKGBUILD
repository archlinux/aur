# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=skylendar
pkgver=5.1.1
pkgrel=1
pkgdesc='Powerful and portable astrology program'
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/${pkgname}"
license=('GPL-2.0-only')
depends=('perl' 'qt5-base' 'qt5-svg' 'libstdc++' 'postgresql-libs')
makedepends=('cmake' 'ninja' 'qt5-tools')
conflicts=('skylendar-bin')
provides=('skylendar')
source=("${url}/files/${pkgname}-${pkgver}pn.tar.xz")
sha256sums=('a4f58fc3d7b8dd10c7d02b1a2d08e66c6cbf0ddf9309549daa96f5e9b0abe244')

#prepare() {
#}

build(){
  cd "$srcdir/${pkgname}-${pkgver}pn"
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}pn"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
