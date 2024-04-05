# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.1.0
pkgrel=1
pkgdesc="Djot HTML renderer with syntax highlighting"
arch=('x86_64')
url="https://git.sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/v$pkgver.tar.gz")
sha512sums=('0350be35cd85aaedba93cd99b6021df50db56355767fc1ee4b8c69c4da54e0bd8b73e3963ab8bcbc062066aa997af4145d311dbdf426a98f92ab310217c8d075')
# build process with inkjet crate is a little... sensitive
options=('!buildflags')

build() {
  cd "dmos-v$pkgver"

  cargo build --release --locked
}

package() {
  cd "dmos-v$pkgver"

  install -Dm755 "target/release/dmos" "$pkgdir/usr/bin/dmos"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
