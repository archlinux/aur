# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=bat
pkgver=0.2.0
pkgrel=1
pkgdesc='A cat(1) clone with syntax highlighting and Git integration'
arch=('x86_64')
url=https://github.com/sharkdp/bat
license=('MIT' 'APACHE')
makedepends=('rust' 'cmake' 'curl' 'libssh2' 'oniguruma')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('546c78b486d746916b348d88cb7a2230c8ad1dfb00c0865517058265a21a1a04401f9b6b47a49971ff91f81234e7fac518e46d650b40c98f0a2cac1e5c47068e')

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
