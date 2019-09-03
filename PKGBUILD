 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=nx-plasma-look-and-feel-git
_gitname=nx-plasma-look-and-feel
pkgver=r204.7d541de
pkgrel=1
pkgdesc="NX Look and Feel package"
arch=('any')
url="https://github.com/nx-desktop"
license=('GPL')
replaces=('nomad-plasma-look-and-feel-git')
conflicts=('nomad-plasma-look-and-feel-git')
depends=('plasma-desktop' 'luv-icon-theme-git' 'kvantum-qt5')
optdepends=('nx-gtk-themes-git')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git+${url}/nx-plasma-look-and-feel.git"
        "git+${url}/nx-kvantum-theme")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  
}

build() {
  
   cd ${srcdir}/${_gitname}
  
   mkdir build && cd build
   cmake .. \
     -DCMAKE_INSTALL_PREFIX=/usr
 
}

package() {
   
   make -C ${srcdir}/${_gitname}/build DESTDIR=${pkgdir} install        
   mkdir -p ${pkgdir}/usr/share/Kvantum/{KvNitrux,KvNitruxDark}
   cp -r ${srcdir}/nx-kvantum-theme/themes/{KvNitrux,KvNitruxDark} ${pkgdir}/usr/share/Kvantum/
 
}
