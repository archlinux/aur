# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=libsodium-static
_pkgname=libsodium
pkgver=1.0.19
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (static library)"
arch=('i686' 'x86_64')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=()
optdepends=('libsodium: headers and pkg-config files')
source=(https://download.libsodium.org/libsodium/releases/$_pkgname-$pkgver.tar.gz)
sha512sums=('8e9b6d796f6330e00921ce37f1b43545966094250938626ae227deef5fd1279f2fc18b5cd55e23484732a27df4d919cf0d2f07b9c2f1aa0c0ef689e668b0d439')
options=('staticlibs')

build() {
  cd "$_pkgname-stable"

  ./configure --prefix=/usr --disable-pie
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
