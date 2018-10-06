# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=breeze-enhanced-git
_gitname=BreezeEnhanced
pkgver=r13.c9f5e8a
pkgrel=1
pkgdesc='A fork of KDE Breeze decoration with additional options'
arch=('any')
url='https://github.com/tsujan/BreezeEnhanced'
license=('GPL3')
depends=('plasma-desktop')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}
   
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
            
build() {
   cd ${srcdir}/${_gitname}
   mkdir build && cd build
   cmake .. \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DKDE_INSTALL_LIBDIR=lib \
            -DBUILD_TESTING=OFF \
            -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
   make
   
}

package() {
   cd ${srcdir}/${_gitname}
   make -C ${srcdir}/${_gitname}/build DESTDIR="$pkgdir" install        

}
