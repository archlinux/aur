# Maintainer: Rémi BERTHO <remi.bertho at dalan dot fr>

pkgname=spore
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple image manager"
arch=('x86_64')
url="https://codeberg.org/dalan/spore"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libgexiv2' 'sqlite')
makedepends=('cargo')
options=(!lto)
source=("https://binaries.dalan.fr/Spore/0.1.0/spore-v$pkgver-src.tar.zst")
sha512sums=('5e5eca6d3b7c4db9bf4dbf38025a7388d3d7c3ad9ff21f8fa7bd28d8b324cc82d99021a3b44db9fea18ae62d0d9d68f4a948804e5fc45ad2549ff1ec68ea5c1c')

build() {
  cd "Spore-v$pkgver-src"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "Spore-v$pkgver-src"
  install -Dm 755 "target/release/spore-cli" -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

