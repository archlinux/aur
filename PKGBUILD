# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=poutine
pkgver=1.1.6
pkgrel=2
pkgdesc="boostsecurityio/poutine"
arch=('x86_64' 'aarch64')
url="https://github.com/boostsecurityio/poutine"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='8918c66db19ecfd12b2f8379e445c3da4589e599'
source=("git+https://github.com/boostsecurityio/poutine.git#commit=$_commit")
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
