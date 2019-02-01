# Maintainer: BrLi <brli@chakralinux.org>
# Contributor: AlmAck

pkgname=plasma5-themes-chakra-heritage
pkgver=r139.fad0b7d
pkgrel=1
pkgdesc='Chakra Plasma 5 Look & Feel theme files'
url='http://www.chakralinux.org'
arch=('x86_64')
license=('LGPL')
# remember to set the wallpaper name and resolution!! in plasma/heritage/metadata.desktop
depends=('plasma-framework')
makedepends=('extra-cmake-modules')
optdepends=('plasma5-wallpapers-chakra-tulip')
_gitsha='fad0b7da'
source=("git+https://code.chakralinux.org/chakra/tools/heritage.git#commit=${_gitsha}")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/heritage
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
    cd $srcdir/heritage
}

build() {
  cd build
  
  cmake ../heritage \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON  
  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install
}
