# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=menyoki
pkgver=0.1.4
pkgrel=1
pkgdesc="Screen{shot,cast} and perform ImageOps on the command line"
arch=('x86_64')
url="https://github.com/orhun/menyoki"
license=('GPL3')
depends=('libx11')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b52469fe39421c2f11c5387b7d9258821fbca1658b77522505aacffa92f044d895e8ddd5c93f6e9f96a91be2da8eabf117bafac624bc8812ff4cb5f81f4629e1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "man/$pkgname.conf.5" -t "$pkgdir/usr/share/man/man5"
  install -Dm 644 "completions/$pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "completions/$pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "completions/$pkgname.zsh" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_$pkgname"
}
