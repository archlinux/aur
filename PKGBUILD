#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDE .desktop entry helpers"
pkgname=xde-helpers-git
_pkgname=xde-helpers
pkgver=1.8.r2.ga4da723d
pkgrel=2
arch=('any')
license=('GPL')
url="http://github.com/bbidulock/xde-helpers"
groups=('xde-git')
depends=('xde-icons' 'xdg-utils' 'gxmessage-gtk2' 'desktop-file-utils')
install=${_pkgname}.install
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
makedepends=('git')
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
