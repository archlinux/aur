# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=0.1.r163.gbf7dee5
pkgrel=1
pkgdesc='Standalone HD Netflix Browser using qt5-webengine (also supports Amazon prime, HBO Go, Hulu, Crunchy Roll)'
arch=('any')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine-widevine')
optdepends=('pepper-flash: Needed for some streaming services')
makedepends=('git')
source=("git+${url}.git"
        "${_gitname}.desktop")
       
sha256sums=('SKIP'
            '656953860c0014977b20eb0f023e1e5e3441a5ec58d4e353230c392d697eaf1a')
       
pkgver() {
   cd ${srcdir}/${_gitname}
   
   #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}
   
prepare() {

   cd ${srcdir}/${_gitname}
   git submodule init
   git submodule update
   
}

build() {
   
   cd ${srcdir}/${_gitname}
   mkdir build && cd build
   qmake -config release ..
   make
      
}

package() {
   
   install -Dm755 ${srcdir}/${_gitname}/build/${_gitname} ${pkgdir}/usr/bin/${_gitname}
   install -Dm644 ${srcdir}/${_gitname}/resources/qtwebflix.svg ${pkgdir}/usr/share/pixmaps/qtwebflix.svg
   install -Dm755 ${srcdir}/${_gitname}.desktop ${pkgdir}/usr/share/applications/${_gitname}.desktop
  

}


