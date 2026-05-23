# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=kasetto-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="A declarative AI agent environment manager, written in Rust"
arch=('x86_64')
url="https://github.com/pivoshenko/kasetto"
license=('MIT' 'Apache-2.0')
depends=('glibc')
provides=('kasetto')
conflicts=('kasetto')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pivoshenko/kasetto/releases/download/v$pkgver/kasetto-x86_64-unknown-linux-gnu.tar.gz"
  "LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/pivoshenko/kasetto/v$pkgver/LICENSE-MIT"
  "LICENSE-APACHE-$pkgver::https://raw.githubusercontent.com/pivoshenko/kasetto/v$pkgver/LICENSE-APACHE"
)
sha256sums=('a4bd72c81182a8418215508a0b0311cb345a19d215bdd23a1a10e205dad89874'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 kasetto "$pkgdir/usr/bin/kasetto"
  install -Dm755 kst "$pkgdir/usr/bin/kst"
  install -Dm644 "LICENSE-MIT-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

  cd "$pkgdir"
  ./usr/bin/kasetto completions bash | install -Dm644 /dev/stdin usr/share/bash-completion/completions/kasetto
  ./usr/bin/kasetto completions zsh | install -Dm644 /dev/stdin usr/share/zsh/site-functions/_kasetto
  ./usr/bin/kasetto completions fish | install -Dm644 /dev/stdin usr/share/fish/vendor_completions.d/kasetto.fish
}
