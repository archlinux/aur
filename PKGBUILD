# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-weave
pkgver=1.1
pkgrel=1
pkgdesc="Weave a tarball sequence into a Git repository"
arch=('any')
depends=('git' 'python2')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('41dcb156f6de90317de58ae91c91ac7afd19158a2846762e0cacc57ad9d4803c')

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
