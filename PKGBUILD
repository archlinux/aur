# Maintainer: Crazygiscool <crazygiscool@proton.me>
# Contributors: Craigyiscool

pkgname=g-shell
pkgver=1.2.5
pkgrel=1
pkgdesc="A POSIX-compliant shell written in Rust with a custom theme system"
arch=('x86_64' 'aarch64')
url="https://github.com/Crazygiscool/G-shell"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
  'fastfetch: welcome banner in default .gshellrc'
  'git: git branch display in prompt'
  'hostname: hostname in prompt'
)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('35983b0a2c063c5d22412ea71dea8d9377dd0acc8aa1787c948a8628e1e9ae80')

build() {
  cd "$srcdir/G-shell-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/G-shell-$pkgver"
  cargo test --frozen
}

package() {
  cd "$srcdir/G-shell-$pkgver"
  install -Dm755 target/release/g-shell "$pkgdir/usr/bin/g-shell"
  install -Dm644 .gshellrc "$pkgdir/usr/share/g-shell/.gshellrc"
  install -Dm644 README.md "$pkgdir/usr/share/doc/g-shell/README.md"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/g-shell/" 2>/dev/null || true
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/g-shell/" 2>/dev/null || true
}
