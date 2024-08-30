# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=idevicerestore
pkgver=1.0.0
pkgrel=5
pkgdesc='Restore/upgrade firmware of iOS devices'
arch=('x86_64')
url='https://www.libimobiledevice.org'
# https://github.com/libimobiledevice/idevicerestore/issues/345
license=('LGPL-3.0-only')
depends=('curl' 'libimobiledevice' 'libplist' 'libirecovery' 'libzip' 'openssl' 'zlib')
makedepends=('git')
# https://aur.archlinux.org/packages/idevicerestore-git/#comment-759041
conflicts=('idevicerestore-git')
source=("git+https://github.com/libimobiledevice/$pkgname.git#tag=$pkgver")
sha256sums=('b0d4d202deffdbd5d5e5b05e41a5a6687b582c89c0a6efd982b38ca2e4385921')

build() {
  cd "$pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
