# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tunsafe-git
pkgver=r9.ge116360
pkgrel=1
pkgdesc="High performance and secure VPN client that uses the WireGuard protocol"
arch=('i686' 'x86_64')
url="https://tunsafe.com/"
license=('AGPL' 'BSD' 'custom: OpenSSL')
depends=('gcc-libs')
makedepends=('git')
provides=('tunsafe')
conflicts=('tunsafe')
source=("git+https://github.com/TunSafe/TunSafe.git")
sha256sums=('SKIP')


prepare() {
  cd "TunSafe"

  sed -i "s/clang++-6.0/g++ $CXXFLAGS/;s/-lrt/-lrt $LDFLAGS/" "build_linux.sh"
}

pkgver() {
  cd "TunSafe"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
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
