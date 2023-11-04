# Maintainer: Rémi BERTHO <remi.bertho at dalan dot fr>

pkgname=notipriv
pkgver=1.0.0
pkgrel=1
pkgdesc="UnifiedPush message sender"
arch=('x86_64')
url="https://git.berthor.eu/dalan/notipriv"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("https://binaries.dalan.fr/$pkgname/$pkgname-$pkgver-src.tar.zst")
sha512sums=('a372b8d785163412f50052d1c50f306aecc4b832a2f3e57af4ab703ec501b471cec6052fc207601989ef76e4ea1095f7e80253ed80a651638174977ff659c37c')

build() {
  cd "$pkgname"
  RUSTFLAGS="-C target-cpu=native" cargo build --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

