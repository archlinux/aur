# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=sierrabreeze-kwin-decoration-git
_gitname=SierraBreeze
pkgver=r65.a84c1c5
pkgrel=1
pkgdesc="OSX-like window decoration for KDE Plasma written in C++ (git version)"
arch=('x86_64')
url="https://github.com/muchanem/SierraBreeze"
license=('GPL2')
depends=('kwin')
makedepends=('git' 'cmake' 'extra-cmake-modules')
optdepends=('breezemite-yakuake-git: Matching theme for Yakuake')
source=("git+${url}.git"
        "breezebutton.ccp.patch")
sha256sums=('SKIP'
            '8a98d8d59ca4c820759e53ac3e7281aa0e6bf87201bc2dcde4585ed60c18707d')

pkgver() {
  
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  
}

prepare() {
cd ${srcdir}/${_gitname}
patch --strip=1 breezebutton.cpp < ../breezebutton.ccp.patch
   
}
   
build() {
  
   cd ${srcdir}/${_gitname}
  
   mkdir build && cd build
   cmake ..  \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DKDE_INSTALL_LIBDIR=lib \
            -DBUILD_TESTING=OFF \
            -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

}

package() {
    
   make -C ${srcdir}/${_gitname}/build DESTDIR="$pkgdir" install        

}

