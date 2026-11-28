# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=daftar-cli-bin
pkgver=0.36.0
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
sha256sums_x86_64=('0cb64fad3a93f48e3d7a07f9c8772f7846d5951200ef0ff8ef58c958dd2e9a23')
sha256sums_aarch64=('00f84a95094be50e04acb56cdede1c5cf768c41086464a65e316535e3b506a42')

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
