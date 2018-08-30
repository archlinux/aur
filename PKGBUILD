# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tunsafe
pkgver=1.4_rc1
pkgrel=1
pkgdesc="High performance and secure VPN client that uses the WireGuard protocol"
arch=('i686' 'x86_64')
url="https://tunsafe.com/"
license=('AGPL' 'BSD' 'custom: OpenSSL')
depends=('gcc-libs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/TunSafe/TunSafe/archive/cf92ac7a0c444ba4b31bdf9b1744705e6542d028.tar.gz")
sha256sums=('7dc8bf8dd136d2db8f3032a215f300189064cc8772d28242be4ebd4c14c0262b')


prepare() {
  mv TunSafe-* "TunSafe"
  cd "TunSafe"

  sed -i "s/clang++-6.0/g++ $CXXFLAGS/;s/-lrt/-lrt $LDFLAGS/" "build_linux.sh"
}

build() {
  cd "TunSafe"

  ./build_linux.sh
}

package() {
  cd "TunSafe"

  install -Dm755 "tunsafe" "$pkgdir/usr/bin/tunsafe"
  install -Dm644 "LICENSE.AGPL.TXT" "$pkgdir/usr/share/licenses/tunsafe/LICENSE.AGPL.TXT"
}
