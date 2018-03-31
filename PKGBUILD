# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=r54.a335ac3
pkgrel=1
pkgdesc='Standalone HD Netflix Browser using qt5-webengine (also supports Amazon prime, HBO Go, Hulu, Crunchy Roll)'
arch=('i686' 'x86_64')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine-widevine')
optdepends=('pepper-flash: Needed for some streaming services')
makedepends=('git')
source=("git+${url}.git"
        "netflix.desktop")
sha256sums=('SKIP'
            '571b202d64ba9a0e1144e6abdabc7288a843985624da01cc03ff43020bee521b')

pkgver() {
   cd ${srcdir}/${_gitname}
   
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
            
build() {
   cd ${srcdir}/${_gitname}

   qmake -config release
   make
   
}

package() {
   
   install -Dm755 ${srcdir}/${_gitname}/qtwebflix ${pkgdir}/usr/bin/qtwebflix
   install -Dm644 ${srcdir}/${_gitname}/data/netflix-desktop.svg ${pkgdir}/usr/share/pixmaps/netflix-desktop.svg
   install -Dm755 ${srcdir}/netflix.desktop ${pkgdir}/usr/share/applications/netflix.desktop

}
