# Maintainer: chenjunyu19 <1335546814@qq.com>

pkgname=deepin-dock-plugin-cmdu-git
pkgver=r31.58d3c4f
pkgrel=1
pkgdesc="A plugin for deepin dock, display uptime, CPU usage, RAM usage and netspeed."
arch=('x86_64')
url="https://github.com/sonichy/CMDU_DDE_DOCK"
depends=('deepin-dock')
makedepends=('git' 'qt5-base' 'qt5-svg')
source=('git+https://github.com/sonichy/CMDU_DDE_DOCK.git' 'cmdu.pro.patch')
md5sums=('SKIP' '420ef08a46387fff3437638be719199f')
_gitname=CMDU_DDE_DOCK

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  patch "$srcdir/$_gitname/cmdu.pro" cmdu.pro.patch
  qmake "$srcdir/$_gitname"
  make ${MAKEFLAGS}
}

package(){
  make INSTALL_ROOT="$pkgdir/usr" install
}
