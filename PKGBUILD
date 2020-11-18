# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dog-dns
_pkgname=dog
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line DNS client like dig"
arch=('x86_64')
url="https://github.com/ogham/dog"
license=('custom:EUPL')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('03af5414b995710d22ea19bdbf382def4e53ae2870f396b4103546743c9cafcc445ee0819b6c8b7f435793fead5ebd03f091be89293a32847868a5544b4bc0e5')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENCE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm 644 "completions/$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "completions/$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "completions/$_pkgname.zsh" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_$_pkgname"
}
