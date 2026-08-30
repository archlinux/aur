# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=cls3
pkgver=0.32.4
pkgrel=4
pkgdesc="The CLI tool \"cls3\" is to CLear S3 Buckets. It empties (so deletes all objects and versions/delete-markers in) S3 Buckets or deletes the buckets themselves."
arch=('x86_64' 'aarch64')
url="https://github.com/go-to-k/cls3"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='7529ecb213e8ee48c1ecf1412f1df59c272e2b22'
source=("git+https://github.com/go-to-k/cls3.git#commit=$_commit")
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
    ./cmd/cls3
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
