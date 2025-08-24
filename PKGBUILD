pkgname=nay-git
pkgver=0.1.0.r1.g$(git rev-parse --short HEAD)
pkgrel=1
pkgdesc="A Rust-based AUR helper and Pacman wrapper"
arch=('x86_64')
url="https://github.com/Honey2339/nay"
license=('MIT')
depends=('pacman')
makedepends=('cargo' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/nay" "$pkgdir/usr/bin/nay"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
