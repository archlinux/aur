# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=qtwebflix-git
_gitname=qtwebflix
pkgver=r22.bee781b
pkgrel=1
pkgdesc='Standalone Netflix Browser using qtwebengine'
arch=('i686' 'x86_64')
url='https://github.com/gort818/qtwebflix'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine')
optdepends=('qt5-webengine-widevine' 'chromium-widevine')
makedepends=('git')
source=("git+${url}.git"
        "netflix.desktop")
sha256sums=('SKIP'
            '2cf2a44a42f1e8275521e30e42a0f56f6e3c82a94d247555f68ed4fbfeec6ab0')

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
