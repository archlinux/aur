# Maintainer: Omibranch
pkgname=commit-roast
pkgver=r0.0000000
pkgrel=1
pkgdesc='AI commit roaster for git history'
arch=('x86_64' 'aarch64')
url='https://github.com/Omibranch/commit-roast'
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
source=("git+https://github.com/Omibranch/commit-roast.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/commit-roast/
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
