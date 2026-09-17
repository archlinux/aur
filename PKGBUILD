# Maintainer: cemsbr <cems@cemshost.com.br>

pkgname=supercompress-proxy
pkgver=0.5.27
pkgrel=1
pkgdesc='Local proxy that compresses LLM context for coding agents (Claude Code, Codex, Cursor, ...)'
arch=('any')
url='https://github.com/Supercompress/Supercompress'
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
optdepends=('bun: TUI mode (supercompress tui)')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('5ec8a8ff7579068499b7c1d59bbe944883c4126f590a90831451609ac1d6fac3')

package() {
  cd package
  # --omit=optional skips @opentui (bun-only native TUI); npm ignores the flag on `install -g`
  npm install --omit=optional --cache "$srcdir/npm-cache"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/node_modules"
  cp -r "$srcdir/package" "$pkgdir/usr/lib/node_modules/$pkgname"
  ln -s "../lib/node_modules/$pkgname/bin/supercompress.js" "$pkgdir/usr/bin/supercompress"
  ln -s "../lib/node_modules/$pkgname/src/mcp.js" "$pkgdir/usr/bin/supercompress-mcp"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
