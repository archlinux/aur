# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=r37.3618d55
pkgrel=2
pkgdesc='Standalone Netflix Browser using qt5-webengine'
arch=('i686' 'x86_64')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine-widevine')
makedepends=('git')
source=("git+${url}.git"
        "netflix.desktop")
sha256sums=('SKIP'
            'aa4310aed2fc068102020e39b2b91ac4c9f54b9876a45bbf44affb47995f5f16')

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
   
   install -Dm755 ${srcdir}/${_gitname}/netflix ${pkgdir}/usr/bin/netflix
   install -Dm644 ${srcdir}/${_gitname}/data/netflix-desktop.svg ${pkgdir}/usr/share/pixmaps/netflix-desktop.svg
   install -Dm755 ${srcdir}/netflix.desktop ${pkgdir}/usr/share/applications/netflix.desktop

}
