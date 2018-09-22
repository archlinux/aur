# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu-git
pkgver=0.7.3.g78db3ee
pkgrel=1
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
groups=('xde')
license=('GPL')
provides=('xde-menu')
conflicts=('xde-menu')
depends=('libwnck+-git' 'libsm' 'gnome-menus')
optdepends=('xdg-launch-git: for LW WM launch notification'
	    'xde-theme: for LW WM style and theme change support')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/xde-menu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -e 's,^[a-zA-Z_]*,,;s,-,.,g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
