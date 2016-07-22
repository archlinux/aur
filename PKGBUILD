
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_pkgname=libsodium
pkgname=lib32-libsodium
pkgver=1.0.10
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('lib32-glibc')
source=("http://download.dnscrypt.org/$_pkgname/releases/$_pkgname-${pkgver}.tar.gz")
sha512sums=('ff52e7f25787cc858e8d26be10913c689bd3dd394c8e163133920141be67a292a1dba066a1037e83cf0ced155a1554f07f24c2f33a7a6aa52521d39f537cd515')

build() {
  cd "$_pkgname-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  #export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

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
