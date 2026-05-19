# Maintainer: Windblows2000 <Xs1244@protonmail.com>
pkgname=nexa-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="High-performance, Rust-based MPRIS controller and daemon"
arch=('x86_64')
url="https://github.com/Windblows2000/Nexa"
license=('GPL3-or-later')
provides=('nexa' 'nexad')
conflicts=('nexa' 'nexa-git')
install=nexa.install
source=("https://github.com/Windblows2000/Nexa/releases/download/v$pkgver/nexa-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('fe118c20ae3cfe8b47f0e9a52f07ff1b231c7434762f561a02e5879ba5633031')

package() {
  cd "$srcdir/nexa-v$pkgver-x86_64-linux"
  install -Dm755 nexa "$pkgdir/usr/bin/nexa"
  install -Dm755 nexad "$pkgdir/usr/bin/nexad"
  install -Dm644 nexad.service "$pkgdir/usr/lib/systemd/user/nexad.service"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  ./nexa completions bash > "$pkgdir/usr/share/bash-completion/completions/nexa"
  ./nexa completions zsh > "$pkgdir/usr/share/zsh/site-functions/_nexa"
  ./nexa completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/nexa.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
