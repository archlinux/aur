# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=docker-debug
pkgver=0.7.11
pkgrel=4
pkgdesc="use new container attach on already container go on debug"
arch=('x86_64' 'aarch64')
url="https://github.com/zeromake/docker-debug"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='c657796b498cff58766528229f88d73cbd6ff746'
source=("git+https://github.com/zeromake/docker-debug.git#commit=$_commit")
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
    ./cmd/docker-debug
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
