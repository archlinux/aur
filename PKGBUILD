# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=fil
pkgver=0.2.8
pkgrel=1
pkgdesc="😋 Unix file command written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/file-go/fil"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/file-go/fil.git#tag=v$pkgver")
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
  install -Dm 644 ReadMe.md -t "$pkgdir/usr/share/doc/$pkgname"
}
