pkgname=mcsast
pkgver=2.3.0
pkgrel=2
pkgdesc="Manage Minecraft server / proxy / plugins quickly and easily!"
arch=('x86_64')
url="https://github.com/MagicTeaMC/Minecraft-server-auto-setup"
license=('GPL-3.0-or-later')
depends=('gcc' 'openssl' 'zlib')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')
options=(!debug)

prepare() {
  mv "$srcdir/Minecraft-server-auto-setup-$pkgver" "$srcdir/mcsast-$pkgver"
}

build() {
  cd "$srcdir/mcsast-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/mcsast-$pkgver"
  strip --strip-unneeded target/release/mcsast
  install -Dm755 "target/release/mcsast" "$pkgdir/usr/bin/mcsast"
}
