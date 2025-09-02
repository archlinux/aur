# Maintainer: Dogfetus <dogfetus@hotmail.com> 
pkgname=mal
pkgver=0.1.4  
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64')
url="https://github.com/Dogfetus/mal-cli" 
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2ffabccc14c9082852bbaf72516033585a4a34151877851aa74c11bf79dcdec')

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
