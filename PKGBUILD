# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=mega-sdk
pkgver=3.3.2
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
md5sums=('81e544bccf6c41336363a5611af3fb6e')

build() {
  cd "sdk-$pkgver"
  ./autogen.sh
  ./configure --with-libuv --prefix=/usr
  make
}

package() {
  cd "sdk-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
