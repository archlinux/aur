# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedoom freedm)
pkgbase=${pkgname[0]}
pkgver=0.13.0
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'dblatex' 'deutex' 'python' 'python-pillow')
source=(https://github.com/$pkgbase/$pkgbase/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('c3ad97bab73b3275ae604f4fef7459b5688f1c5fc63336475c34b6c22a56118c3558ad9859ac80d7abc97426a48e5f2b92ac9e02def11f9f0f7f1a2ef76629a5')

prepare() {
  cd "$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgbase-$pkgver"

  make
}

package_freedm() {
  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedm
}

package_freedoom() {
  replaces=('freedoom1' 'freedoom2')
  conflicts=('freedoom1' 'freedoom2')
  provides=('freedoom1' 'freedoom2')

  cd "$pkgbase-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install-freedoom
}
