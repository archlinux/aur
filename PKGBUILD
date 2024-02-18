# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mpvc
pkgver=1.4.3
pkgrel=1
pkgdesc="An mpc-like CLI tool for mpv"
arch=('x86_64')
url="https://github.com/neeshy/mpvc"
license=('GPL-3.0-or-later')
depends=('mpv')
makedepends=('cargo')
source=("https://github.com/neeshy/mpvc/archive/v$pkgver.tar.gz")
sha256sums=('9979493422ce4faa06257ce4ef8ced6f1334d389887ca56117411c7c25bcef92')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build -r --bins --examples
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
