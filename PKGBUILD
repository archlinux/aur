pkgname=wtfis-cli
pkgver=1.0.3
pkgrel=1
pkgdesc='Find projects fast from your terminal'
arch=('x86_64')
url='https://github.com/prophesourvolodymyr/WTFIS-CLI'
license=('WTFPL')
depends=('glibc')
makedepends=('rust')
optdepends=('bash: Bash shell integration' 'zsh: Zsh shell integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/prophesourvolodymyr/WTFIS-CLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da8f18f6126562c7972bb0c957a8856db8a806ef71bca0671bfa087789934f9c')

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
