# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=skylendar
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Powerful and portable astrology program'
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/${pkgname}"
license=('GPL-2.0-only')
depends=('perl' 'qt5-base' 'qt5-svg' 'libstdc++' 'postgresql' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt5-tools')
conflicts=('skylendar-bin')
provides=('skylendar')
source=("${url}/files/${pkgname}-${pkgver}pn.tar.xz")
sha256sums=('fa4a424b025f103ca0a1482a0877d7c149be4742cf89ffc82ebb2f6cfb3b2a2d')

# prepare() {
# }

build() {
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
