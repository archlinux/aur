# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=agent-deck
pkgver=0.12.3
pkgrel=1
pkgdesc="Terminal session manager for AI coding agents. Built with Go + Bubble Tea."
arch=('x86_64' 'aarch64')
url="https://github.com/asheshgoplani/agent-deck"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/asheshgoplani/agent-deck.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/agent-deck
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
