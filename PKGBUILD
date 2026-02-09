# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gowebdav
pkgver=0.12.0
pkgrel=3
pkgdesc="A golang WebDAV client library and command line tool."
arch=('x86_64' 'aarch64')
url="https://github.com/studio-b12/gowebdav"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/studio-b12/gowebdav.git#tag=v$pkgver")
sha256sums=('SKIP')

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
