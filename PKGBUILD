# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu-git
_pkgname=xde-menu
pkgver=0.11.r0.g7fce7e4
pkgrel=2
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
groups=('xde-git')
license=('GPL')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=('libwnck+-git' 'libsm' 'gnome-menus')
makedepends=('git')
optdepends=('xdg-launch-git: for LW WM launch notification'
	    'xde-theme: for LW WM style and theme change support')
source=("$pkgname::git+https://github.com/bbidulock/$_pkgname.git")
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

# vim: et sw=2:
