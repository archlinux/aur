# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=cmix-git
pkgver=20.r10.g3cf2d2f
pkgrel=1
pkgdesc="lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage"
arch=('x86_64')
url="https://github.com/byronknoll/cmix"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'clang' 'make')
provides=('cmix')
conflicts=('cmix')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd $pkgname
  make CC=clang++
}

package() {
  install -D -m755 "$srcdir/$pkgname/cmix" "${pkgdir}/usr/bin/cmix"
}
