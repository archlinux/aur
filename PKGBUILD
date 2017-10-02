# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=r22.bee781b
pkgrel=1
pkgdesc='Standalone Netflix Browser using qtwebengine'
arch=('i686' 'x86_64')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('qt5-webengine-widevine' 'xdg-utils')
makedepends=('git')
source=("git+${url}.git"
        "netflix.desktop")
sha256sums=('SKIP'
            'd78844d1b9b8fce9ec462fa56eb70b359626b19102cb68d2d4b9b50e382b0a56')

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
  install -Dm644 ${srcdir}/${_gitname}/data/netflix.svg ${pkgdir}/usr/share/pixmaps/netflix.svg
  install -Dm755 ${srcdir}/netflix.desktop ${pkgdir}/usr/share/applications/netflix.desktop
}
