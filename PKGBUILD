# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gojekyll
pkgver=0.3.1
pkgrel=2
pkgdesc="A fast Go implementation of the Jekyll blogging engine"
arch=('x86_64' 'aarch64')
url="https://github.com/osteele/gojekyll"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='79c6a973ed890e333b1e78fdf8aadf7e4c68f4c1'
source=("git+https://github.com/osteele/gojekyll.git#commit=$_commit")
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
