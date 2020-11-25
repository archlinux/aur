# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=menyoki
pkgver=0.1.3
pkgrel=1
pkgdesc="Screen{shot,cast} and perform ImageOps on the command line"
arch=('x86_64')
url="https://github.com/orhun/menyoki"
license=('GPL3')
depends=('libx11')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('118698465b0d4ad7f9a8ef1dfbf0bc28faed597f68987754e47cfa10303c84c6c5f75be8a6033cb14ede35e3b5fafa30ff7eab8cb28f17a812981097c49d2819')

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
