# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=mega-sdk
pkgver=3.0.0
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
source=("https://github.com/meganz/sdk/archive/v$pkgver.tar.gz"
        'libuv.patch')
md5sums=('0765cc618b80d5f7982cb8252150d863'
         '714997fd02c35c7ec68a8bc753e824bd')

prepare() {
  cd "sdk-$pkgver"
  patch -p1 -i ../libuv.patch
}

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
