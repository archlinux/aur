#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=lxkb_config-git
pkgver=r153.cec6ebd
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

source=("$pkgname::git://lxde.git.sourceforge.net/gitroot/lxde/lxkb_config")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
