# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>

_pkgname=xcb-proto
pkgname=${_pkgname}-git
pkgver=1.11.r93.gfef8a4c
pkgrel=1
pkgdesc="XML-XCB protocol descriptions"
arch=('any')
url="http://xcb.freedesktop.org/"
license=('custom')
makedepends=('git' 'python' 'libxml2')
provides=("xcb-proto=$pkgver")
conflicts=('xcb-proto')
source=("$pkgname::git://git.freedesktop.org/git/xcb/proto")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
#  sed -i 's/\t/    /g' "$pkgdir/usr/lib/python3.3/site-packages/xcbgen/xtypes.py"
}
