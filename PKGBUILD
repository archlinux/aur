# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Matt Coffin <mcoffin13@gmail.com>
pkgname=bossa-git
pkgver=1.9.1.r8.g8202074
pkgrel=2
pkgdesc="Flash programming utility for Atmel's SAM family of flash-based ARM microcontrollers"
arch=('i686' 'x86_64')
url="https://github.com/shumatech/BOSSA"
license=('BSD')
makedepends=('git')
depends=('readline' 'wxgtk')
provides=('bossa')
conflicts=('bossa')
source=("git://github.com/shumatech/BOSSA"
        "arduino-reset.patch::https://github.com/shumatech/BOSSA/pull/78.patch")
sha256sums=('SKIP'
            'da2571b32da6dd7212654efb96aa7f17a80790e695118f8a13847ffca62de294')

pkgver() {
  cd "$srcdir/BOSSA"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/BOSSA"
  patch -Np1 -i "$srcdir/arduino-reset.patch"
}

build() {
  cd "$srcdir/BOSSA"
  make
}

package() {
  cd "$srcdir/BOSSA"
  install -Dm755 -t "$pkgdir/usr/bin/" bin/bossa*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}

# vim:set ts=2 sw=2 et:
