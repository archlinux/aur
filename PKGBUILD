# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.58
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/cvs-fast-export/-/archive/$pkgver/cvs-fast-export-$pkgver.tar.gz")
b2sums=('f6a60fd0963a9573b37ae6f78d381f289bb0f590625b9ac16cc7c227d7fa134876a26ff7a7cd59dbd8ef1f1027d402739b8a83a5dd5b089c5c64a3df44f55d63')

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
