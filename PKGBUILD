# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-styles-git
_pkgname=xde-styles
pkgver=1.7.r2.g8e70fe2
pkgrel=1
pkgdesc="Four consistent styles across light-weight WMs for XDE"
arch=('any')
url="http://github.com/bbidulock/xde-styles"
groups=('xde-git')
license=('CCPL:by-sa')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=('m4')
makedepends=('git')
optdepends=('xdg-launch: for key bindings'
            'xde-menu: for root menus'
            'xde-ctools: for window menus'
            'xde-session: for key bindings')
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
