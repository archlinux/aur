
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_pkgname=libsodium
pkgname=lib32-libsodium
pkgver=1.0.8
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('lib32-glibc')
source=("http://download.dnscrypt.org/$_pkgname/releases/$_pkgname-${pkgver}.tar.gz")
sha512sums=('8f85e85e699c2b45674befd466e018c9f2ff1333c8fa806da49d9674068c33929bd3463e8908ffcd9c6154d430737e08e0522ac8ed4219e4fffe2e0a7a611c65')

build() {
  cd "$_pkgname-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # lib32 cleanup
  rm -rf "$pkgdir"/usr/{bin,lib,include,share} "$pkgdir/etc"

  # install license
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

