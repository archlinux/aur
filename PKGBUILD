# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=stree
pkgver=0.0.21
pkgrel=4
pkgdesc="📁Directory trees of AWS S3 Bucket"
arch=('x86_64' 'aarch64')
url="https://github.com/orangekame3/stree"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='228e6f44b989c3634d49aaf9672c4f9ae69a4509'
source=("git+https://github.com/orangekame3/stree.git#commit=$_commit")
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
