# Maintainer: adytzu2007 <adrian.bacircea@gmail.com>

pkgname=cryptopp
pkgver=8.7.0
pkgrel=1
pkgdesc="Crypto++ Library is a free C++ class library of cryptographic schemes."
arch=(x86_64)
url="https://www.cryptopp.com"
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "https://github.com/weidai11/cryptopp/releases/download/CRYPTOPP_${pkgver//./_}/${pkgname}${pkgver//./}.zip"
)
sha256sums=(
  'd0d3a28fcb5a1f6ed66b3adf57ecfaed234a7e194e42be465c2ba70c744538dd'
)

build() {
  cd "$srcdir"
  make all
}

package() {
  cd "$srcdir"
  make PREFIX="/usr" DESTDIR="$pkgdir/" cryptopp.pc install
  install -m 644 -Dt "$pkgdir/usr/lib/pkgconfig" "$srcdir/libcryptopp.pc"
  install -m 644 -Dt "$pkgdir/usr/share/licenses/${pkgname}" "$srcdir/License.txt"
}
