# Maintainer: Peter Krauß <ptrxyz@gmail.com>

pkgname=trayer-srg-git
pkgver=r108.f15b6d2
pkgrel=1
pkgdesc="trayer fork with multi monitor support, cleaned up codebase and other fancy stuff (git-version)"
arch=(i686 x86_64)
url="https://github.com/sargon/trayer-srg"
depends=('gtk2')
makedepends=('git')
provides=('trayer-srg-git')
conflicts=('trayer' 'trayer-srg')
source=("trayer-srg-git::git+http://github.com/sargon/trayer-srg.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$pkgname"

  ./configure
  make PREFIX="$pkgdir/usr" install
  install -D -m644 "man/trayer.1" "${pkgdir}/usr/share/man/man1/trayer.1"
}
