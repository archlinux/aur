# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=ocproxy-git
_pkgname=ocproxy
pkgver=r128.3070366
pkgrel=1
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
