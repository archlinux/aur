# Maintainer: Mattia Moffa <mattia@moffa.xyz>

pkgname=vde-netemu-git
pkgver=r3.df3d677
pkgrel=1
pkgdesc="An alternative implementation of vde's wirefilter based on a different organization of components"
arch=('x86_64')
url="https://github.com/virtualsquare/vde-netemu"
license=('GPL2')
depends=('vde2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('vde-netemu::git+https://github.com/virtualsquare/vde-netemu.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make CFLAGS+=-Wno-implicit-int
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}
