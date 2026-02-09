# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=mirrorbits
pkgver=0.6.1
pkgrel=3
pkgdesc="Mirrorbits is a geographical download redirector written in Go for distributing files efficiently across a set of mirrors."
arch=('x86_64' 'aarch64')
url="https://github.com/etix/mirrorbits"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/etix/mirrorbits.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
