# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=chrome-pak-customizer-git
_pkgname=chrome-pak-customizer
pkgver=2.0.r12.g20cc7c1
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/myfreeer/chrome-pak-customizer"
license=('MIT')
depends=()
makedepends=('git' 'cmake' 'ninja' 'gcc')
source=("${_pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -pv "$srcdir/$_pkgname"/build
  cd "$srcdir/$_pkgname"/build
  cmake -GNinja -DLGPL=OFF ..
  ninja
}

package() {
  install -Dvm755 "$srcdir/$_pkgname/build/pak" "$pkgdir/usr/bin/pak"
}

# vim:set ts=2 sw=2 et:
