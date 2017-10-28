# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=r31.833ef83
pkgrel=1
pkgdesc='Standalone Netflix Browser using qtwebengine'
arch=('i686' 'x86_64')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine-widevine')
makedepends=('git')
source=("git+${url}.git"
        "netflix.desktop")
sha256sums=('SKIP'
            '1ac5c897828fb047709081dc96b1edbbcbfb644e8ea4ece04cef7c99f1887fd0')

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
