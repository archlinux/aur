# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=libsodium-static
_pkgname=libsodium
pkgver=1.0.18
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (static library)"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=()
optdepends=('libsodium: headers and pkg-config files')
source=(https://download.libsodium.org/libsodium/releases/$_pkgname-$pkgver-stable.tar.gz)
sha512sums=('eca6f6c981c896579db5cf1a270417f14d8c81f692fcec7ff6fd0d826b6d4264219adf0681a3f0fd6d2a43699d999abbf25b3e01b692ade1267a44b7fdd62c85')
options=('staticlibs')

build() {
  cd "$_pkgname-stable"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname-stable"
  make check
}

package() {
  cd "$_pkgname-stable"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/include/"
  rm -f "$pkgdir/usr/lib/"*.so*
  rm -rf "$pkgdir/usr/lib/pkgconfig"

  # install license
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
