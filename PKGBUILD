# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.57
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/cvs-fast-export/-/archive/$pkgver/cvs-fast-export-$pkgver.tar.gz")
b2sums=('4ce0739cdbbd16912ef1341a99a898a0e50701eec51749adbd829528cde52142e64f0db41e7d3ec9376aab992e4ccff95ba3dd8eda69c99ac6a71a86e6c87d09')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  make "$pkgname"{,.1} cvssync.1
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
