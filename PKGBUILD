
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_pkgname=libsodium
pkgname=lib32-libsodium
pkgver=1.0.3
pkgrel=2
pkgdesc="P(ortable|ackageable) NaCl-based crypto library"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('lib32-glibc')
source=("http://download.dnscrypt.org/$_pkgname/releases/$_pkgname-${pkgver}.tar.gz")
sha512sums=('7d58ddf973bfc456c2d196129d2c3a9ddec6e40b977797251385cd42bdd1234987779566903b7c2251cae02aab7e1c5246967af4c887be8a3451ae3f745c1ae5')

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

