# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=mega-sdk-git
pkgver=3.0.0.r1240.g788d4207
pkgrel=1
pkgdesc="Official mega.nz SDK (development branch)"
arch=('i686' 'x86_64')
url="https://github.com/meganz/sdk"
license=('BSD-2-Clause')
depends=('c-ares'
         'crypto++'
         'curl'
         'freeimage'
         'fuse'
         'libsodium'
         'libuv'
         'openssl'
         'readline'
         'sqlite'
         'zlib')
makedepends=('git')
conflicts=('mega-sdk')
provides=('mega-sdk')
source=("git+https://github.com/meganz/sdk.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd sdk
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd sdk
  ./autogen.sh
  ./configure --with-libuv --prefix=/usr
  make
}

package() {
  cd sdk
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
