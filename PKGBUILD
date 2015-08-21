# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-debubble
pkgver=1.2
pkgrel=1
pkgdesc="Clean up merge bubbles in a Git repository"
arch=('any')
depends=('git')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz"
        0001-Makefile-Sanitize-the-install-and-uninstall-targets.patch)
sha256sums=('59ea9a3ba342ce690134f99444eb5bda6b7db19cf5ec02556cb52b02625d0a9f'
            'f68b95013f34e9d10716bb61f5343c054fdda269a7f61229fbd52fcc0c624511')

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
