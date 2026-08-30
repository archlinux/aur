# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gowebdav
pkgver=0.13.0
pkgrel=2
pkgdesc="A golang WebDAV client library and command line tool."
arch=('x86_64' 'aarch64')
url="https://github.com/studio-b12/gowebdav"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go' 'git')
_commit='58d70dc017221d604b5679d30e69f60418ac078d'
source=("git+https://github.com/studio-b12/gowebdav.git#commit=$_commit")
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
    ./cmd/gowebdav
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
