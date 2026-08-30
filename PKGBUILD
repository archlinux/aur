# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=wacli
pkgver=0.17.1
pkgrel=2
pkgdesc="WhatsApp CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/wacli"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
_commit='97e14efdf91a7c9de1b68845321eb6355943b5f5'
source=("git+https://github.com/steipete/wacli.git#commit=$_commit")
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
    ./cmd/wacli
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
