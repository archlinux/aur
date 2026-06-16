# Maintainer: Comma, Marmarek-here (on GitHub)
pkgname=archbrew
pkgver=1.1.0
pkgrel=2
pkgdesc="Homebrew-like standalone CLI package manager for Arch"
arch=('x86_64')
url="https://github.com/Comma-off/ArchBrew"
source=("https://github.com/Comma-off/ArchBrew/archive/refs/tags/v${pkgver}.tar.gz")
license=('MIT')
depends=('glibc' 'pacman')
makedepends=('cargo')
optdepends=()
sha256sums=('b078e04409fdb090ffa5c7697f98b203ea2251fbc16c37dd4f336aed3be5d8e9')

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