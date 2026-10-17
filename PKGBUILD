# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=blockfont-git
pkgver=0.1.1_r0_g3776377
pkgrel=1
pkgdesc="C shared library that renders text using a 6x5 grid of ASCII blocks, with scaling and ANSI colors"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/TheElevatedOne/blockfont.h"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/blockfont.h"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cd "${srcdir}/blockfont.h"
  make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
  cd "${srcdir}/blockfont.h"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
