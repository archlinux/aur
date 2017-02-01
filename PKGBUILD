# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Ray Rashif <schiv [at] archlinux [dot] org>
# Contributor: Max a.k.a. Synthead <synthead [at] gmail [dot] com>
# Contributor: christhemonkey <christhemonkey [at] gmail [dot] com>

pkgname=flowcanvas
pkgver=0.7.1
pkgrel=5
pkgdesc="Gtkmm/Gnomecanvasmm widget for boxes-and-lines style environments"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/flowcanvas/"
depends=('libgnomecanvasmm' 'graphviz>=2.34')
makedepends=('boost' 'python2')
license=('GPL')
install=$pkgname.install
source=("http://download.drobilla.net/$pkgname-$pkgver.tar.bz2"
        "graphviz-2.30.patch")
md5sums=('a4908f6385ce9fd2ce97c8caa823f053'
         'e5b2b23d8be0c9fa14b8b52379a15155')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # graphviz 2.30 compatibility
  # see http://dev.drobilla.net/ticket/888
  # adapted from FreeBSD patch (just stripped their stuff)
  # potentially unstable (nothing committed by developer yet)
  # may have to incorporate proposed patch for ganv (successor to this lib)
  patch -Np0 -i "$srcdir/graphviz-2.30.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  CXXFLAGS+=' -std=c++11'
  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf install --destdir="$pkgdir"
}
