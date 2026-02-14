pkgname=prs-scan
pkgver=2.0.0
pkgrel=1
pkgdesc="Defensive-first web security scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/MOYARU/prs"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/prs"
  go build -trimpath -buildmode=pie -ldflags "-s -w" -o prs-scan ./main.go
}

package() {
  cd "$srcdir/prs"
  install -Dm755 prs-scan "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
