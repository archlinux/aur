# Maintainer: Omibranch
pkgname=hiring
pkgver=r0.0000000
pkgrel=1
pkgdesc='Passive-aggressive AI HR rejection generator for code projects'
arch=('x86_64' 'aarch64')
url='https://github.com/Omibranch/hiring'
license=('MIT')
makedepends=('git' 'go')
depends=('glibc' 'libnotify')
source=("git+https://github.com/Omibranch/hiring.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/hiring/
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
