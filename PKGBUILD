pkgname=wtfis-cli
pkgver=1.0.2
pkgrel=1
pkgdesc='Find projects fast from your terminal'
arch=('x86_64')
url='https://github.com/prophesourvolodymyr/WTFIS-CLI'
license=('WTFPL')
depends=('glibc')
makedepends=('rust')
optdepends=('bash: Bash shell integration' 'zsh: Zsh shell integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/prophesourvolodymyr/WTFIS-CLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04abb5745906cb16f14eb322e01804c4b5d23f433be4820520bb1c3cca43cc68')

build() {
  cd "$srcdir/WTFIS-CLI-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/WTFIS-CLI-$pkgver"

  install -Dm755 target/release/wtfis "$pkgdir/usr/bin/wtfis"
  install -Dm755 target/release/cdd "$pkgdir/usr/bin/cdd"
  install -Dm644 shell/wtfis.bash "$pkgdir/usr/share/wtfis/wtfis.bash"
  install -Dm644 shell/wtfis.zsh "$pkgdir/usr/share/wtfis/wtfis.zsh"
  install -Dm644 shell/wtfis.ps1 "$pkgdir/usr/share/wtfis/wtfis.ps1"
}
