# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=mega-sdk
pkgver=2.8.0
pkgrel=1
pkgdesc="Official mega.nz SDK"
arch=('i686' 'x86_64')
url="https://github.com/meganz/sdk"
license=('BSD-2-Clause')
depends=('curl'
         'c-ares'
         'openssl'
         'crypto++'
         'zlib'
         'sqlite'
         'freeimage'
         'libsodium')
source=("https://github.com/meganz/sdk/archive/v$pkgver.tar.gz")
md5sums=('b1a59b30fc7d6d99bde439a7d12a07e6')

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
