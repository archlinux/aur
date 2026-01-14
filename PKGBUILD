# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=libsodium-static
_pkgname=libsodium
pkgver=1.0.21
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (static library)"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=()
optdepends=('libsodium: headers and pkg-config files')
source=(https://download.libsodium.org/libsodium/releases/$_pkgname-$pkgver.tar.gz)
sha512sums=('ee8cc2f3f5707b172bf75d8c04afbd5f0c83c6f94dbab3f988f07aab716d96f1662556a59e09b3d83c3bd5c22f59327ad95937bf499d523c86146f4df830f777')
options=('staticlibs')

build() {
  cd "$_pkgname-$pkgver"

  ./configure --prefix=/usr --disable-pie
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
