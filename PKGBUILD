#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=repo-notes-bin
pkgver=20260729.0
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
source_x86_64=("repo-notes-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/repo-notes-${pkgver}-linux-${CARCH}.tar.gz")
source_aarch64=("repo-notes-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/repo-notes-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('aa1f22fdd7f5f1e5a3407b208ce4af4714afb28099e2b091c0863d4dd67aabdb')
sha256sums_aarch64=('4cc61b04094874f4cf54c3183f0597f46dde2ab3282c12491571fd8313f3ec36')

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
