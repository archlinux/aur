# Maintainer: Mila <aldair@waifu.club>
pkgname=vpngate-git
pkgver=20251125.r1
pkgrel=1
pkgdesc="Simple CLI client for VPNGate"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/davegallant/vpngate"
license=('GPL-3.0-or-later')
depends=('openvpn')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/davegallant/vpngate.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # We could also do something like latestversion-commit
  printf "%s.r%s" \
    "$(git log -1 --date=short --format="%ad" | tr -d -)" \
    "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "dist/vpngate" "$pkgdir/usr/bin/vpngate"
}
