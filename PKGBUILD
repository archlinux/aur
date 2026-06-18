# Maintainer: franlol
pkgname=iptop
pkgver=0.1.0
pkgrel=1
pkgdesc="htop for your network — a beautiful real-time IP traffic monitor for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/iptop"
license=('MIT')
makedepends=('bun')
conflicts=('iptop-bin')
options=(!strip)
source=("iptop-$pkgver.tar.gz::https://github.com/franlol/iptop/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('fd6b4cf409bb52a6dfaef50302fdd01253c0284272f190a6c328b5e54aef97ef')

build() {
  cd "$srcdir/iptop-0.1.0"
  bun install --frozen-lockfile
  bun build --compile src/index.tsx --outfile iptop
}

package() {
  cd "$srcdir/iptop-0.1.0"
  install -Dm755 iptop "$pkgdir/usr/bin/iptop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
