# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=waimea-git
_pkgname=waimea
pkgver=0.5.0.11
pkgrel=1
pkgdesc="An X11 window manager designed for maximum efficiency"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/waimea"
license=('GPL')
provides=('waimea')
conflicts=('waimea' 'waimea-cvs')
depends=('perl' 'libxrandr' 'imlib2' 'libxinerama' 'libxft')
makedepends=('git')
source=("$pkgname::git://github.com/bbidulock/waimea.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
