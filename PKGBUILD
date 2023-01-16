# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=waylend
pkgver=0.1.0
pkgrel=1
pkgdesc="A calm and simple logout menu"
arch=('x86_64')
url="https://sr.ht/~bitfehler/waylend"
license=('EUPL-1.2')
depends=('atk' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('28edc0be571c70e8f3d4bbbd973a3d49c1a0323cc222599744940b8bd2584464a93067897c091e32782dd38f41fc62b440982b82bdc6d0ffe2452e761b32cc08')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/waylend" "$pkgdir/usr/bin/waylend"
  install -Dm644 "config.toml" "$pkgdir/etc/waylend.toml"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.icons"
}
