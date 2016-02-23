# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-weave
pkgver=1.2
pkgrel=1
pkgdesc="Weave a tarball sequence into a Git repository"
arch=('any')
depends=('git' 'python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0b20a041598d0e8ddfa632d34b832478329db7061e750fbf55edef1ebbbb569e')

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

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix=/usr install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
