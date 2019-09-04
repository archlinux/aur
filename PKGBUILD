# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu-git
pkgver=0.10.r0.g1bfb93c
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
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
