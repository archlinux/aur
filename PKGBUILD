# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xde-theme
pkgver=1.1.100
pkgrel=1
pkgdesc="Theme and style setting utilities for the X Desktop Environment (XDE)"
groups=('xde')
arch=('i686' 'x86_64')
license=('GPL3')
url="http://github.com/bbidulock/xde-theme"
depends=('libxinerama' 'gdk-pixbuf2' 'libxrandr')
optdepends=('xde-styles: for styles that work with xde-style')
makedepends=('git')
source=("$pkgname::git://github.com/bbidulock/$pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
 ./configure --prefix=/usr --sysconfdir=/etc
 make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:

