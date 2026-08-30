# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=agent-deck
pkgver=1.15.0
pkgrel=2
pkgdesc="Terminal session manager for AI coding agents. Built with Go + Bubble Tea."
arch=('x86_64' 'aarch64')
url="https://github.com/asheshgoplani/agent-deck"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='bf50689893053c6dd33a29b21e12eb36e251d94b'
source=("git+https://github.com/asheshgoplani/agent-deck.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download
}

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
