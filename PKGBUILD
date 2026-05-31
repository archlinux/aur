# Maintainer: Comma, Marmarek-here (on GitHub)
pkgname=archbrew
pkgver=1.0.1
pkgrel=1
pkgdesc="Homebrew-like standalone CLI package manager for Arch"
arch=('x86_64')
url="https://github.com/Marmarek-here/ArchBrew"
source=("https://github.com/Marmarek-here/ArchBrew/archive/refs/tags/v${pkgver}.tar.gz")
license=('MIT')
depends=('glibc' 'pacman')
makedepends=('cargo')
optdepends=()
sha256sums=('02ad69a1f92fc4f27f2c95a6bbea359c5fd045e31e30a9a5e02cf8c5899fa6f5')

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