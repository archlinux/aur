# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=saw
pkgver=0.2.2
pkgrel=6
pkgdesc="Fast, multi-purpose tool for AWS CloudWatch Logs"
arch=('x86_64' 'aarch64')
url="https://github.com/TylerBrock/saw"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='785718a1783792b69fd00466c0954d89a947c8b9'
source=("git+https://github.com/TylerBrock/saw.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod init github.com/TylerBrock/saw
  go mod tidy
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
