# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal
pkgver=0.3.1
pkgrel=1
pkgdesc="Command line recycle bin"
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
conflicts=('conceal-bin')
depends=('skim')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('565f82c8392dc715c41b10647f3b05caa5fc6081443808ecd9456c3d5ba4dfa8')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "target/release/conceal" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/conceal/_conceal" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/conceal/conceal.bash" "$pkgdir/usr/share/bash-completion/completions/conceal"
  install -Dm 644 "completions/conceal/conceal.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/conceal/conceal.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 755 "target/release/cnc" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/cnc/_cnc" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/cnc/cnc.bash" "$pkgdir/usr/share/bash-completion/completions/cnc"
  install -Dm 644 "completions/cnc/cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/cnc/cnc.nu" -t "$pkgdir/usr/share/nushell/completions"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
