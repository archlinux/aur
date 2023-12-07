# Maintainer: Shulhan <ms@kilabit.info>

pkgname=libsodium-1.0.18
pkgver=1.0.18
pkgrel=1
pkgdesc="A modern, portable, easy to use crypto library for libsodium.so.23"
arch=('i686' 'x86_64')
url="https://libsodium.org/"
license=('custom:ISC')
depends=('glibc')
makedepends=('autoconf' 'automake')
provides=("libsodium=$pkgver")
options=('staticlibs')
source=('https://github.com/jedisct1/libsodium/releases/download/1.0.18-RELEASE/libsodium-1.0.18.tar.gz')
sha256sums=('6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1')


build() {
  cd "libsodium-$pkgver"

  ./autogen.sh -s
  ./configure --prefix="/usr" \
    --includedir="/usr/include/sodium-1.0.18" \
    --libdir="/usr/lib/sodium-1.0.18"
  make
}

check() {
  cd "libsodium-$pkgver"

  make check
}

package() {
  cd "libsodium-$pkgver"

  make DESTDIR="$pkgdir" install

  ln -s /usr/lib/sodium-1.0.18/libsodium.so.23.3.0 $pkgdir/usr/lib/libsodium.so.23
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libsodium-1.0.18/"
}
