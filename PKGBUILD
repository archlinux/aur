# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tunsafe
pkgver=1.4
pkgrel=2
pkgdesc="High performance and secure VPN client that uses the WireGuard protocol"
arch=('i686' 'x86_64')
url="https://tunsafe.com/"
license=('AGPL-1.0' 'BSD-3-Clause' 'OpenSSL')
depends=('gcc-libs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/TunSafe/TunSafe/archive/v$pkgver.tar.gz")
sha256sums=('a435e5bfd0decf6a2bd89b547851f3ccb3673365b6ace03e483fe66227010738')


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
