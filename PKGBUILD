# Maintainer:
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>

_pkgname="xcb-proto"
pkgname="$_pkgname-git"
pkgver=1.17.0.r1.g4d2879a
pkgrel=1
pkgdesc="XML-XCB protocol descriptions"
url="https://gitlab.freedesktop.org/xorg/proto/xcbproto"
license=('X11')
arch=('any')

makedepends=(
  'git'
  'libxml2'
  'python'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "${pkgdir:?}/usr/share/licenses/$pkgname"
}
