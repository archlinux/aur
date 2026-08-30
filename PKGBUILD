# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=n26
pkgver=1.5.6
pkgrel=4
pkgdesc="API and CLI to get information of your N26 account"
arch=('x86_64' 'aarch64')
url="https://github.com/guitmz/n26"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='ffa147f6ea3a03439d8fe2c0f25d397183596ab3'
source=("git+https://github.com/guitmz/n26.git#commit=$_commit")
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
    ./cmd/n26
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
