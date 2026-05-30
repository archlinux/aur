# Maintainer: Comma, Marmarek-here (on GitHub)
pkgname=archbrew
pkgver=1.0.0
pkgrel=1
pkgdesc="Homebrew-like standalone CLI package manager for Arch"
arch=('x86_64')
url="https://github.com/Marmarek-here/ArchBrew"
source=("https://github.com/Marmarek-here/ArchBrew/archive/refs/tags/v${pkgver}.tar.gz")
license=('MIT')
depends=('glibc' 'pacman')
makedepends=('cargo')
optdepends=()
sha256sums=('636e8dc1fbeb7478077eeac6ae27b53ba767e5e2441b4ef1062890f8ca44b742')

build() {
  cd "ArchBrew-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "ArchBrew-${pkgver}"
  cargo test --locked
}

package() {
  cd "ArchBrew-${pkgver}"
  install -Dm755 "target/release/archbrew" "$pkgdir/usr/bin/archbrew"
  ln -sf "archbrew" "$pkgdir/usr/bin/brew"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}