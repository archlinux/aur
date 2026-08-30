# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=blipgloss
pkgver=0.4.7
pkgrel=4
pkgdesc="Style definitions for nice terminal layouts 👄"
arch=('x86_64' 'aarch64')
url="https://github.com/wobsoriano/blipgloss"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='a7ba348413bed22e90d37e42abd53f2833e6cdc1'
source=("git+https://github.com/wobsoriano/blipgloss.git#commit=$_commit")
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
