# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=chrome-pak-customizer-git
_pkgname=chrome-pak-customizer
pkgver=2.0.r12.g20cc7c1
pkgrel=5
pkgdesc="a simple command-line tool to pack and unpack pak files in chrome or chromium-based browser"
arch=(any)
url="https://github.com/myfreeer/chrome-pak-customizer"
license=('MIT')
makedepends=('git' 'cmake' 'ninja' 'gcc')
source=("${pkgname}::git+${url}")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cmake -S . -B build -GNinja -DLGPL=OFF
  cmake --build build
}

package() {
  install -Dvm755 "$srcdir/$pkgname/build/pak" "$pkgdir/usr/bin/pak"
  install -Dvm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dvm644 "$srcdir/$pkgname/LICENSE.LGPL" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.LGPL"
}

# vim:set ts=2 sw=2 et:
