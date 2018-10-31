# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=mega-sdk
pkgver=3.4.3
pkgrel=1
pkgdesc="Official mega.nz SDK"
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
source=("https://github.com/meganz/sdk/archive/v$pkgver.tar.gz")
md5sums=('bc01b24824747738432f478e5a2e9f1e')

build() {
  cd "sdk-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "sdk-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
