# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=tabtoy
pkgver=3.1.4
pkgrel=3
pkgdesc="高性能表格数据导出器"
arch=('x86_64' 'aarch64')
url="https://github.com/davyxu/tabtoy"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/davyxu/tabtoy.git#tag=$pkgver")
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
