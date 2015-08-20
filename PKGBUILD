# Maintainer: Peter Krauß <ptrxyz@gmail.com>

pkgname=trayer-srg
_gitname=trayer-srg
pkgver=r106.fcb92d6
pkgrel=1
pkgdesc="trayer fork with multi monitor support, cleaned up codebase and other fancy stuff (git-version)"
arch=(i686 x86_64)
url="https://github.com/sargon/trayer-srg"
depends=('gtk2')
makedepends=('git')
provides=('trayer')
conflicts=('trayer')
source=("git://github.com/sargon/trayer-srg.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"

  ./configure
  make PREFIX="$pkgdir/usr" install
}
