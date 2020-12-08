# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=menyoki
pkgver=1.0.2
pkgrel=1
pkgdesc="Screen{shot,cast} and perform ImageOps on the command line"
arch=('x86_64')
url="https://github.com/orhun/menyoki"
license=('GPL3')
depends=('libx11')
makedepends=('rust')
optdepends=('slop: area selection support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a0754606fbfa70b188b91c5154010aa6ac024020954f5c741715101cd32ee95e46e7652e632f18b96d4f87c07cc422ce76e4520790f8809cf04c9f350f940029')

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
