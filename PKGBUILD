# Maintainer: Buce <dmbuce@gmail.com>

pkgname=mcexplore-git
pkgver=1.7.r38.g89dc312
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="Use a minecraft server to generate a square of land."
arch=(any)
url="https://github.com/DMBuce/mcexplore"
license=('CCPL:by-sa')
groups=()
depends=(python python-nbt)
provides=(mcexplore)
conflicts=(mcexplore)
makedepends=('git' 'asciidoc')
source=("$pkgname::git://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
