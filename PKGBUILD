# Maintainer: Undercat037 <deltacatdeveloper@gmail.com>
pkgname=aura-emerge
pkgver=1.22.0
pkgrel=1
pkgdesc="Portage-like wrapper for Arch Linux using Aura"
arch=('x86_64')
url="https://github.com/Undercat037/aura-emerge"
license=('GPL-3.0')
depends=('aura')
optdepends=('asp: for --abs support (build from ABS source)'
            'gnupg: for PGP verification when building from ABS')
makedepends=('rust' 'cargo')
conflicts=('portageq-shim')
install=aura-emerge.install
backup=('etc/emerge/world.set')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Undercat037/aura-emerge/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "aura-emerge-main"
  cargo build --release
}

package() {
  cd "aura-emerge-main"
  install -Dm755 target/release/aura-emerge "$pkgdir/usr/local/bin/emerge"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -dm755 "$pkgdir/etc/emerge"
  install -Dm644 /dev/null "$pkgdir/etc/emerge/world.set"
}