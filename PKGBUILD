# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=world-cup-2022-cli-dashboard
pkgver=1.4.0
pkgrel=4
pkgdesc="Watch live World Cup 2022 matches in your terminal. ⚽🏆"
arch=('x86_64' 'aarch64')
url="https://github.com/cedricblondeau/world-cup-2022-cli-dashboard"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='630685f639881e72ef2f14cac9e04dc1011ec715'
source=("git+https://github.com/cedricblondeau/world-cup-2022-cli-dashboard.git#commit=$_commit")
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
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
