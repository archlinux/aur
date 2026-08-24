# Maintainer: Roberto Alsina <ralsina@kde.org>
pkgname=nicolino
pkgver=0.24.0
pkgrel=1
pkgdesc="A fast, modular static site generator written in Crystal"
arch=("x86_64" "aarch64")
url="https://github.com/ralsina/nicolino"
license=("MIT")
depends=("crystal>=1.21.0" "pandoc" "libvips" "libyaml")
makedepends=("shards" "git")
source=("$pkgname-$pkgver::git+https://github.com/ralsina/nicolino.git#tag=v$pkgver")
sha256sums=('0964fe6668992fb9b6d9ce5b7f065cdabf7181fb03a38ce5c5e8e27438e50ecb')

build() {
  cd "$pkgname-$pkgver"
  shards build --release --error-trace
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "bin/nicolino" "$pkgdir/usr/bin/nicolino"

  # Install license
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
