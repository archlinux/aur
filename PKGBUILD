# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=wacli
pkgver=0.2.0
pkgrel=2
pkgdesc="WhatsApp CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/wacli"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/steipete/wacli.git#tag=v$pkgver")
sha256sums=('SKIP')

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
