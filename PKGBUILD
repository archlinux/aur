# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.4.9
pkgrel=1
pkgdesc="An mpc-like CLI tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL-3.0-only')
depends=('mpv')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('0987ce74d07682abf0a7275a9503f90a3d9b6ec78adba850d041723ecc4a819b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build -r --bins --examples
  target/release/mpvc completion bash >etc/mpvc.bash
  target/release/mpvc completion fish >etc/mpvc.fish
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/mpvc "$pkgdir/usr/bin/mpvc"
  install -Dm755 target/release/examples/mpvc-polybar "$pkgdir/usr/bin/mpvc-polybar"
  install -Dm755 examples/mpvc-fzf "$pkgdir/usr/bin/mpvc-fzf"
  install -Dm644 etc/mpvc.bash "$pkgdir/usr/share/bash-completion/completions/mpvc"
  install -Dm644 etc/mpvc.zsh "$pkgdir/usr/share/zsh/site-functions/_mpvc"
  install -Dm644 etc/mpvc.fish "$pkgdir/usr/share/fish/vendor_completions.d/mpvc.fish"
}
