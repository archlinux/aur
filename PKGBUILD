# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-noice-git
_pkgname="${pkgname%-git}"
pkgver=1.8.0.r1.g20f47dc
pkgrel=1
pkgdesc="Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu."
arch=('any')
url="https://github.com/folke/noice.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-nui')
makedepends=('git')
optdepends=('neovim-notify: notifications'
            'neovim-tree-sitter: syntax highlighting'
	    'tree-sitter-viml: syntax highlighting'
	    'tree-sitter-regex: syntax highlighting'
	    'tree-sitter-lua: syntax highlighting'
	    'tree-sitter-bash: syntax highlighting'
	    'tree-sitter-markdown: syntax highlighting'
	    'tree-sitter-markdown-inline: syntax highlighting')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	find lua doc \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/plugins/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
