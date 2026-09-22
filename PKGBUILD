#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=repo-notes-bin
pkgver=20260922.0
pkgrel=1
pkgdesc="Standalone CLI and MCP server for repository notes (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/notes"
license=('Apache-2.0')
depends=('glibc' 'git')
provides=('repo-notes')
conflicts=('repo-notes' 'repo-notes-git')
options=('!strip')
install=repo-notes.install
source=('notes.bash' 'notes.fish' '_notes' 'LICENSE')
source_x86_64=("repo-notes-${pkgver}-linux-x86_64.tar.gz::$url/releases/download/${pkgver}/repo-notes-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("repo-notes-${pkgver}-linux-aarch64.tar.gz::$url/releases/download/${pkgver}/repo-notes-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('af3fe063b2ec0cd8d093b5b51a7c900f199104fd20b695f415567fc506aa9880')
sha256sums_aarch64=('9311420c22b35eee96c96feec0ca5edc8a559adc50e0943cde8dc20a85a3b2f8')

package() {
  install -Dm755 notes "$pkgdir/usr/bin/notes"
  ln -s notes "$pkgdir/usr/bin/note"
  ln -s notes "$pkgdir/usr/bin/handoffs"
  ln -s notes "$pkgdir/usr/bin/handoff"
  install -Dm644 notes.bash "$pkgdir/usr/share/bash-completion/completions/notes"
  install -Dm644 notes.fish "$pkgdir/usr/share/fish/vendor_completions.d/notes.fish"
  install -Dm644 _notes "$pkgdir/usr/share/zsh/site-functions/_notes"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
