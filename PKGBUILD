# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=deheader-git
pkgver=1.10.r0.gd3d73b1
pkgrel=2
pkgdesc="Find and remove unneeded includes in C/C++ sourcefiles"
arch=('any')
url="https://www.catb.org/~esr/deheader/"
license=('BSD')
depends=('python')
makedepends=('git' 'docbook-xml' 'docbook-xsl' 'xmlto')
provides=("deheader=$pkgver")
conflicts=('deheader')
source=("git+https://gitlab.com/esr/deheader.git")
sha256sums=('SKIP')


pkgver() {
  cd "deheader"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "deheader"

  make
}

check() {
  cd "deheader"

  make check
}

package() {
  cd "deheader"

  install -Dm755 "deheader" -t "$pkgdir/usr/bin"
  install -Dm644 "deheader.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/deheader"
}
