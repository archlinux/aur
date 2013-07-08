#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=lxkb_config-git
pkgver=01e64dc
pkgrel=1
pkgdesc='A keyboard configuration application for LXDE'
arch=('i686' 'x86_64')
url="http://lxde.org/"
license=('GPL')
groups=('lxde')
provides=('lxkb_config')
conflicts=('lxkb_config')
depends=('gtk2')
makedepends=('git' 'intltool')
options=('!emptydirs')

source=('git://lxde.git.sourceforge.net/gitroot/lxde/lxkb_config')
md5sums=('SKIP')

_gitname="lxkb_config"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="$pkgdir" install
}
