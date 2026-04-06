# Maintainer: Omibranch
pkgname=404life
pkgver=r0.0000000
pkgrel=1
pkgdesc='Background terminal daemon that prints existential idle messages'
arch=('x86_64' 'aarch64')
url='https://github.com/Omibranch/404life'
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
source=("git+https://github.com/Omibranch/404life.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build -trimpath -ldflags="-s -w" -o "$pkgname" ./cmd/404life/
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
