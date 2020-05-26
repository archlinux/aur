# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.55
pkgrel=1
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('i686' 'x86_64')
depends=('python')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/cvs-fast-export/-/archive/$pkgver/cvs-fast-export-$pkgver.tar.gz")
b2sums=('889def84c5e0482b759c71abc4a014afe65c0a045c4e1c28bde9993da7865e41c22d4635cd3c22c3a99c5a0b077513d46eac8e698772aa595c6b41e771b953f6')

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
