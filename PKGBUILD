# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>

_pkgname=xcb-proto
pkgname=${_pkgname}-git
pkgver=xcb.rproto.1.14.1.0.g496e3ce
pkgrel=1
pkgdesc="XML-XCB protocol descriptions"
arch=('any')
url="https://xcb.freedesktop.org/"
license=('custom')
makedepends=('git' 'python' 'libxml2')
provides=("xcb-proto=$pkgver")
conflicts=('xcb-proto')
source=("$pkgname::git+https://gitlab.freedesktop.org/xorg/proto/xcbproto.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -m755 -d "$pkgdir/usr/share/licenses/$_pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$_pkgname"

}
