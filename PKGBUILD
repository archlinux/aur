# Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>

_pkgname=util-cursor
pkgname=xcb-${_pkgname}-git
pkgver=0.1.2.r0.g8eb844d
pkgrel=2
epoch=1
pkgdesc='XCB cursor management library'
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xcb/${_pkgname}"
license=('MIT')
depends=('libxcb' 'xcb-util-renderutil' 'xcb-util-image')
makedepends=('git' 'xorg-util-macros' 'gperf')
provides=("xcb-${_pkgname}")
conflicts=("xcb-${_pkgname}")
source=("$_pkgname::git+http://anongit.freedesktop.org/git/xcb/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  git submodule update --init
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp "$srcdir/$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
