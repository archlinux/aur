# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=libsodium-static
_pkgname=libsodium
pkgver=1.0.10
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (static library)"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('glibc')
optdepends=('libsodium: headers and pkg-config files')
source=("http://download.dnscrypt.org/$_pkgname/releases/$_pkgname-${pkgver}.tar.gz")
sha512sums=('ff52e7f25787cc858e8d26be10913c689bd3dd394c8e163133920141be67a292a1dba066a1037e83cf0ced155a1554f07f24c2f33a7a6aa52521d39f537cd515')
options=('staticlibs')

build() {
  cd "$_pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/include/"
  rm -f "$pkgdir/usr/lib/"*.so*
  rm -rf "$pkgdir/usr/lib/pkgconfig"

  # install license
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
