# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedoom freedm)
pkgbase=${pkgname[0]}
pkgver=0.12.1
pkgrel=4
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'dblatex' 'deutex' 'python' 'python-pillow')
source=(https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.xz
        0001-manual-build-with-asciidoc.patch)
b2sums=('db783fd8a3467ab6ec628eb67b036ae069d01516b3f04860d4fda0692921f9a4aa65169ff8b79fa74e88bb496da3686dd7fbbf5e4bb1614ab331023a58c5204d'
        '08f5fc17055e921a374aaf2cf092bdf1ff8b5a4069f9b9f5b12f0a119291d1f34d891a2b47e01d966340768c620f44f00848ef01b4675777df25f74a2f160645')

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
