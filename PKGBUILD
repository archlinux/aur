# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=daftar-cli-bin
pkgver=0.35.0
pkgrel=1
pkgdesc="The command line and TUI of Daftar, for an Obsidian vault in a Git repository"
arch=(x86_64 aarch64)
url="https://github.com/parham-alvani/notes-linux"
license=('GPL-3.0-only')
depends=(gcc-libs glibc)
optdepends=('git: syncing the vault')
provides=('daftar-cli')
conflicts=('daftar-cli' 'daftar-bin')
source_x86_64=("https://github.com/parham-alvani/notes-linux/releases/download/v${pkgver}/daftar-cli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/parham-alvani/notes-linux/releases/download/v${pkgver}/daftar-cli-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('285d62558d6982cfd32ffb0c1308ba8d9efae1db9823f2e3a8053b43b09dff3f')
sha256sums_aarch64=('144ccf7a3972ae46f358facf63e11f189d41e73dfbcbcf8fb6f20d371fcf37b4')

package() {
  cd "daftar-cli-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 daftar-cli "$pkgdir/usr/bin/daftar-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # The completions call daftar-cli back, so they follow its commands and the vault's notes.
  local cli="$pkgdir/usr/bin/daftar-cli"
  install -d "$pkgdir/usr/share/bash-completion/completions" "$pkgdir/usr/share/zsh/site-functions" "$pkgdir/usr/share/fish/vendor_completions.d"
  "$cli" completions bash > "$pkgdir/usr/share/bash-completion/completions/daftar-cli"
  "$cli" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_daftar-cli"
  "$cli" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/daftar-cli.fish"
  "$cli" man --dir "$pkgdir/usr/share/man/man1"
}
