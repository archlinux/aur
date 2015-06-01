# Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>

pkgname='snowshoe-git'
pkgver=r452.f131998
pkgrel=1
epoch=1
pkgdesc="Snowshoe is an open source project to build a cross platform browser application with multiple user interfaces while sharing the same core engine, based on Qt5 and WebKit2 technologies."
arch=('i686' 'x86_64')
url="https://github.com/snowshoe/snowshoe"
license=('LGPL2.1')
depends=('qt5-quick1')
makedepends=('git')
_gitname='snowshoe'
source=("$_gitname::git+https://github.com/snowshoe/snowshoe#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  qmake
  make
}

package() {
  cd $_gitname
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"

  cp -rf snowshoe "${pkgdir}/usr/bin/"
  cp src/icons/snowshoe80.png "${pkgdir}/usr/share/pixmaps/"
  cp src/desktop/snowshoe.desktop "${pkgdir}/usr/share/applications"
}
