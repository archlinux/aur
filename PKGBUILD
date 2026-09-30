# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=quarry-sql-bin
_pkgname=quarry
pkgver=0.1.0
pkgrel=1
pkgdesc='A fast SQL client and TUI for PostgreSQL, MySQL / MariaDB and SQLite (prebuilt)'
arch=('x86_64')
url='https://github.com/mah3uz/quarry'
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=(
  'openssh: SSH tunnels (--ssh)'
  'less: paging long results'
)
provides=('quarry-sql')
# quarry-sql is this built from source; the AUR's `quarry` (a board-game GUI) also installs /usr/bin/quarry.
conflicts=('quarry-sql' 'quarry')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('20e5ff5606719267da6e6579c75c35d162250fbd6f5f5b366985a71cbce13c72')

package() {
  cd "$_pkgname-$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 quarry -t "$pkgdir/usr/bin"
  install -d "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions,fish/vendor_completions.d}
  ./quarry --completions bash > "$pkgdir/usr/share/bash-completion/completions/quarry"
  ./quarry --completions zsh > "$pkgdir/usr/share/zsh/site-functions/_quarry"
  ./quarry --completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/quarry.fish"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
