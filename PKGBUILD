# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgbase=nullfs
pkgname=(nul1fs nulnfs nullfs)
pkgver=latest
pkgrel=1
pkgdesc="FUSE nullfs drivers"
arch=('any')
url="https://github.com/xrgtn/nullfs"
depends=('fuse')
makedepends=('git')
license=('GPL')
source=("git+https://github.com/xrgtn/nullfs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgbase"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgbase"

  make nul1fs
  make nulnfs
  g++ -lfuse -o nullfs nullfs.c++
}

package_nul1fs() {
  install -Dm 755 "$srcdir/$pkgbase/nul1fs" \
    "$pkgdir/usr/bin/nul1fs"
}

package_nulnfs() {
  install -Dm 755 "$srcdir/$pkgbase/nulnfs" \
    "$pkgdir/usr/bin/nulnfs"

}

package_nullfs() {
  install -Dm 755 "$srcdir/$pkgbase/nullfs" \
    "$pkgdir/usr/bin/nullfs"

}

# Copy README? LICENSE?
