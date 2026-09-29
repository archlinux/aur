#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=repo-notes-bin
pkgver=20260929.0
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
sha256sums_x86_64=('1bebf95f977cdbaef71c79234c8ecdbff256e2e191bb6ccd704662ba7779922c')
sha256sums_aarch64=('6f1fd9c2edb4ded09c7e68759e5d35ab4f7390e2ea3c07c060a65b7e8c9490b1')

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
