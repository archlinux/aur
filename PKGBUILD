# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gotun
pkgver=0.8.0
pkgrel=3
pkgdesc="一个基于 SSH 的正向代理工具，让你的 HTTP/HTTPS 请求从远程主机的网络环境中发出，实现对其可达资源的透明访问。An SSH-powered forward proxy CLI that makes your network requests originate from the remote host."
arch=('x86_64' 'aarch64')
url="https://github.com/Sesame2/gotun"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/Sesame2/gotun.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/gotun
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
