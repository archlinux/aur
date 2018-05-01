# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=bat
pkgver=0.2.1
pkgrel=1
pkgdesc='A cat(1) clone with syntax highlighting and Git integration'
arch=('x86_64')
url=https://github.com/sharkdp/bat
license=('MIT' 'APACHE')
makedepends=('rust' 'cmake')
depends=('curl' 'libssh2' 'oniguruma')
conflicts=('bacula-bat')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('acf19eb6062dbb4fc52c15e87864823081c929077b00a38b0f27558f310c53f9890f3f0d502a77601bd010fe66d651f42993a8a68351ab1bf222b0e8b1943e7f')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  #install -Dm644 doc/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 LICENSE-APACHE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}
