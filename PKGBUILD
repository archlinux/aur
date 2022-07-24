# Maintainer: Vincent Bernardoff <va AT luminar.eu.org>

pkgname=ta-lib-git
pkgver=v0.6.0.rc.1.r8.g6d0abee8
pkgrel=1
pkgdesc='A library providing common functions for the technical analysis of financial market data'
url='https://github.com/vbmithr/ta-lib'
license=('BSD')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
makedepends=('git' 'autoconf' 'automake' 'm4' 'make')
source=("git+https://github.com/vbmithr/ta-lib"
        'LICENSE')
sha256sums=('SKIP'
            '10ddcfc0d685173fdee2d7e8791540bb1a8526a0f66f7795bdf7dad23457b10e')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
