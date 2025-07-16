# Contributor: libele <libele@disroot.org>
# Contributor: John Robinson <jbr100uk@googlemail>
# Contributor: Rene Wiermer <rwiermer@googlemail>
# Contributor: Eric Forgeot <http://ifiction.free.fr>

pkgname=frobtads
pkgver=2.0
pkgrel=4
pkgdesc="Combined TADS 2 & 3 interpreter and compilers for playing and creating Interactive Fiction games"
arch=('i686' 'x86_64')
url="https://tads.org/frobtads.htm"
license=('custom: freeware')
depends=('ncurses' 'curl')
makedepends=('cmake' 'git')
source=("https://github.com/realnc/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('5188944620298695508b9b41a2dba49c')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cd build
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir" install

  cd ..
  install -Dm644 tads3/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
