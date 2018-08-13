 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=nomad-plasma-look-and-feel-git
_gitname=nomad-plasma-look-and-feel
pkgver=r148.f138e8e
pkgrel=1
pkgdesc="Nomad Look and Feel package."
arch=('any')
url="https://github.com/nomad-desktop"
license=('GPL')
depends=('plasma-desktop' 'luv-icon-theme-git' 'kvantum-qt5')
optdepends=('nomad-gtk-themes-git')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git+${url}/nomad-plasma-look-and-feel.git"
        "git+${url}/nomad-kvantum-theme")
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
   mkdir -p ${pkgdir}/usr/share/Kvantum/{KvNomad,KvNomadDark}
   cp -r ${srcdir}/nomad-kvantum-theme/themes/{KvNomad,KvNomadDark} ${pkgdir}/usr/share/Kvantum/
 
}
