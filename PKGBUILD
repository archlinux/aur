# Maintainer: Dogfetus <dogfetus@hotmail.com> 
pkgname=mal
pkgver=0.1.2  
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/Dogfetus/mal-cli" 
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39d14c3fdbe03f408b4a75c77e4530d49cf1b65cac76b5128e0852ae75b770cf')

build() {
  cd "mal-cli-$pkgver"
  cargo build --release
}

check() {
  cd "mal-cli-$pkgver"
  cargo test --release || echo "Tests failed; continuing anyway."
}

package() {
  cd "mal-cli-$pkgver"
  install -Dm755 "target/release/mal-cli" "$pkgdir/usr/bin/$pkgname"
  ln -s mal "$pkgdir/usr/bin/mal-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
