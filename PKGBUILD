# Maintainer: chenjunyu19 <1335546814@qq.com>

pkgname=deepin-dock-plugin-cmdu-git
pkgver=r32.d959c09
pkgrel=2
pkgdesc="A plugin for deepin dock, displaying uptime, CPU usage, RAM usage and netspeed."
arch=('x86_64')
url="https://github.com/sonichy/CMDU_DDE_DOCK"
depends=('qt5-base' 'deepin-dock')
makedepends=('git')
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
