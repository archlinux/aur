pkgname=libsnsf9x-git
pkgver=r28.6b8bd73
pkgrel=1
pkgdesc="SNSF playing library based on the Snes9x emulator"
arch=(i686 x86_64)
url='https://github.com/Deewiant/libsnsf9x'
license=(LGPL2.1)
depends=(zlib)
makedepends=(git)
source=(${pkgname}::git+https://github.com/Deewiant/libsnsf9x.git)
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
}

# vim:set sw=2 et:
