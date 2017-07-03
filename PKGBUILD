# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ocproxy-git
_pkgname=ocproxy
pkgver=1.60.r8.g8f15425
pkgrel=3
epoch=
pkgdesc="A user-level SOCKS and port forwarding proxy for OpenConnect based on lwIP"
depends=('libevent')
makedepends=('git')
arch=('i686' 'x86_64')
url="https://github.com/cernekee/ocproxy"
license=('BSD')
source=("git+https://github.com/cernekee/ocproxy.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
