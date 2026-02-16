#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=cheat-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="cheat allows you to create and view interactive cheatsheets on the command-line"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=("MIT")
conflicts=('cheat')
provides=('cheat')
source_i686=("$pkgname-$pkgver-i686.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-386.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-amd64.gz")
source_armv5h=("$pkgname-$pkgver-armv5h.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm5.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm6.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm7.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.gz::https://github.com/cheat/cheat/releases/download/$pkgver/cheat-linux-arm64.gz")
url="https://github.com/cheat/cheat"
sha256sums_i686=('586794f83d13fbb08c47bce47ecdba2e6934becd6bbcfe34e10b584ef5a0c758')
sha256sums_x86_64=('8c8405574d51d63ee89594bfed241f478d507d96af78e5c370dcbe65633d7b34')
sha256sums_armv5h=('34d1e97d1f607208ba2e8f6ea3cd473e104ac783fee2b5c934157f93e990262c')
sha256sums_armv6h=('5fbcc3b3fb684552fd20fcf5d0a5792f6d3e0bb58871620cd98304103274637a')
sha256sums_armv7h=('1b01797e1ccb482562eaa1b704379373f1fec12657c142443467fefcda09826d')
sha256sums_aarch64=('78fd70fedd7c2cd297af827c29c495c8f6d2b9a880739450ac13e18eefa2f17b')

package() {
  chmod +x "$pkgname-$pkgver-$CARCH"

  # Generate completion scripts
  ./$pkgname-$pkgver-$CARCH --completion bash > cheat.bash
  ./$pkgname-$pkgver-$CARCH --completion fish > cheat.fish
  ./$pkgname-$pkgver-$CARCH --completion zsh > cheat.zsh

  # Unpack, flag as executable and move to the right directory
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/cheat"

  # Install completion scripts
  install -Dm644 "cheat.bash" "$pkgdir/usr/share/bash-completion/completions/cheat"
  install -Dm644 "cheat.fish" "$pkgdir/usr/share/fish/vendor_completions.d/cheat.fish"
  install -Dm644 "cheat.zsh" "$pkgdir/usr/share/zsh/site-functions/_cheat"
}
