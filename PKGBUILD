# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=cloud189
pkgver=0.6.8
pkgrel=2
pkgdesc="基于天翼云接口的go客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/gowsp/cloud189"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='d4d7c603f0c90a31ff1868e0610d7f230d3a1bf8'
source=("git+https://github.com/gowsp/cloud189.git#commit=$_commit")
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
    ./cmd/cloud189
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
