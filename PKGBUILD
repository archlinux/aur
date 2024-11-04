# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=etherdump
pkgver=2.11
pkgrel=2
_commit=7c1689b7807a32ee64e6aa4d61b950ce80d6fcff
pkgdesc="An extremely small packet sniffer."
arch=('x86_64')
url="https://github.com/peterwwillis/etherdump"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
source=("git+${url}.git#commit=$_commit"
        "fix-compilation-errors.patch")
sha256sums=('33685e67762bf3fecddef870c4662355d27a0f750998998afa3206ec4a604e1f'
            '7012120e2c9fa9af41f84a75aa4be2447436e4dcc20e098276033ab77d4bd02f')

prepare() {
  patch -d "$pkgname" -p1 < fix-compilation-errors.patch
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm 755 etherdump "$pkgdir/usr/bin/etherdump"
  install -Dm 644 CHANGES README -t "$pkgdir/usr/share/doc/etherdump/README"
}

# vim:set ts=2 sw=2 et:
