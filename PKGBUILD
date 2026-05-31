# Maintainer: Comma, Marmarek-here (on GitHub)
pkgname=archbrew
pkgver=1.0.2
pkgrel=1
pkgdesc="Homebrew-style package management interface for Arch Linux"
arch=('x86_64')
url="https://github.com/Marmarek-here/ArchBrew"
source=("https://github.com/Marmarek-here/ArchBrew/archive/refs/tags/v${pkgver}.tar.gz")
license=('MIT')
depends=('glibc' 'pacman')
makedepends=('cargo')
optdepends=()
sha256sums=('8e9bd0c73b95ee175935933b15b057ac24d6da604ac8127515ccdb457cfed39d')

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
