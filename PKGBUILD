# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedoom freedm)
pkgbase=${pkgname[0]}
pkgver=0.12.1
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
makedepends=('asciidoc' 'deutex' 'python')
source=(https://github.com/$pkgbase/$pkgbase/releases/download/v$pkgver/$pkgbase-$pkgver.tar.xz)
sha512sums=('08a8489e1bbd9418262bfefaa9afe67a281b6f3fd38f77ac822438da434229bb034077e53658c06fa93cbf3ba3c5c25dab5fe1844fe23043e310d21866e12810')

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
