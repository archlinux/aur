# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>

pkgname=xcb-proto-git
pkgver=1.8.r70.g29beba6
pkgrel=3
pkgdesc="XML-XCB protocol descriptions"
arch=('any')
url="http://xcb.freedesktop.org/"
license=('custom')
makedepends=('git' 'python' 'libxml2')
provides=("xcb-proto=$pkgver")
conflicts=('xcb-proto')
source=("git://git.freedesktop.org/git/xcb/proto")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/proto"

  git describe --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/proto"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/proto"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  sed -i 's/\t/    /g' "$pkgdir/usr/lib/python3.3/site-packages/xcbgen/xtypes.py"
}
