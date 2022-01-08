# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=0.1.r184.g3741139
pkgrel=1
pkgdesc='Standalone HD Netflix Browser using qt5-webengine (also supports Amazon prime, HBO Go, Hulu, Crunchy Roll)'
arch=('any')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine' 'chromium-widevine')
optdepends=('pepper-flash: Needed for some streaming services')
makedepends=('git')
source=("git+${url}.git"
        "${_gitname}.desktop")
       
sha256sums=('SKIP'
            '7b15975f63818493b965926c336e37b8716f9550d23058fc9057004d3f7ffb2f')
       
pkgver() {
   cd ${srcdir}/${_gitname}
   
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


