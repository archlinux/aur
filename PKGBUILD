# Maintainer: Omibranch
pkgname=doki-ghostwriter
pkgver=r0.0000000
pkgrel=1
pkgdesc='Realistic terminal code typing simulator'
arch=('x86_64' 'aarch64')
url='https://github.com/Omibranch/ghostwriter'
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
source=("git+https://github.com/Omibranch/ghostwriter.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ghostwriter"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ghostwriter"
  go build -trimpath -ldflags="-s -w" -o ghostwriter ./cmd/ghostwriter/
}

package() {
  cd "$srcdir/ghostwriter"
  install -Dm755 ghostwriter "$pkgdir/usr/bin/ghostwriter"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
