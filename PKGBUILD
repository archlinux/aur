pkgname=wtfis-cli
pkgver=1.0.1
pkgrel=1
pkgdesc='Find projects fast from your terminal'
arch=('x86_64')
url='https://github.com/prophesourvolodymyr/WTFIS-CLI'
license=('WTFPL')
depends=('glibc')
makedepends=('rust')
optdepends=('bash: Bash shell integration' 'zsh: Zsh shell integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/prophesourvolodymyr/WTFIS-CLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f175d9f022ac98bcb89242579dac17f9b14e867a8cc5ba862bd6957f4330ee42')

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
