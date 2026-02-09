# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=gscript
pkgver=0.1.1
pkgrel=3
pkgdesc=" framework to rapidly implement custom droppers for all three major operating systems"
arch=('x86_64' 'aarch64')
url="https://github.com/gen0cide/gscript"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/gen0cide/gscript.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/gscript
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
