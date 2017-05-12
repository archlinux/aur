# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=mega-sdk
pkgver=3.1.0
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
         'sqlite'
         'zlib')
source=("https://github.com/meganz/sdk/archive/V$pkgver.tar.gz")
md5sums=('4a5091c7a30787039d45de6c0e457bb5')

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
