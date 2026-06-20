# Maintainer: franlol
pkgname=iptop
pkgver=0.1.1
pkgrel=1
pkgdesc="htop for your network — a beautiful real-time IP traffic monitor for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/iptop"
license=('MIT')
makedepends=('bun')
conflicts=('iptop-bin')
options=(!strip)
source=("iptop-$pkgver.tar.gz::https://github.com/franlol/iptop/archive/refs/tags/v0.1.1.tar.gz")
sha256sums=('227243969d58758354d7a25f859c44c2643cbc1c9196a2b3d27fae6ac2a9cbc7')

build() {
  cd "$srcdir/iptop-0.1.1"
  bun install --frozen-lockfile
  bun build --compile src/index.tsx --outfile iptop
}

package() {
  cd "$srcdir/iptop-0.1.1"
  install -Dm755 iptop "$pkgdir/usr/bin/iptop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
