# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=kasetto-bin
pkgver=3.6.2
pkgrel=1
pkgdesc="A declarative AI agent environment manager, written in Rust"
arch=('x86_64')
url="https://github.com/pivoshenko/kasetto"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('kasetto')
conflicts=('kasetto')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pivoshenko/kasetto/releases/download/v$pkgver/kasetto-x86_64-unknown-linux-gnu.tar.gz"
  "LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/pivoshenko/kasetto/v$pkgver/LICENSE-MIT"
  "LICENSE-APACHE-$pkgver::https://raw.githubusercontent.com/pivoshenko/kasetto/v$pkgver/LICENSE-APACHE"
)
sha256sums=('2e469a816d84cc457775e7d76e89acfc93096bb1f6fbc3e6daa24086a3078362'
            '477e9dbc8f0f6e1a6f467dbcca256b4892ddde9a694e471b8edaaf3266cece45'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

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
