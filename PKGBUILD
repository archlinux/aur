# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tree-sitter-git
pkgver=r2567.a8bce851
pkgrel=1
pkgdesc="Neovim tree-sitter configurations and abstraction layer"
arch=('any')
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'tree-sitter')
makedepends=('git')
optdepends=(
	'tree-sitter-bash: Bash shell grammar'
	'tree-sitter-bibtex: BibTeX grammar'
	'tree-sitter-c: C grammar'
	'tree-sitter-clojure: Clojure grammar'
	'tree-sitter-commonlisp: Common Lisp grammar'
	'tree-sitter-cpp: C++ grammar'
	'tree-sitter-css: CSS grammar'
	'tree-sitter-c-sharp: C# grammar'
	'tree-sitter-elixir: Elixir grammar'
	'tree-sitter-erlang: Erlang grammar'
	'tree-sitter-fish: Fish shell grammar'
	'tree-sitter-go: Golang grammar'
	'tree-sitter-haskell: Haskell grammar'
	'tree-sitter-html: HTML grammar'
	'tree-sitter-java: Java grammar'
	'tree-sitter-javascript: Javascript and JSX grammar'
	'tree-sitter-jsdoc: JSDoc grammar'
	'tree-sitter-json: JSON grammar'
	'tree-sitter-jsonc: JSONC grammar'
	'tree-sitter-julia: Julia grammar'
	'tree-sitter-kotlin: Kotlin grammar'
	'tree-sitter-latex: LaTeX grammar'
	'tree-sitter-make: Makefile grammar'
	'tree-sitter-nix: Nix grammar'
	'tree-sitter-ocaml: OCaml grammar'
	'tree-sitter-php: PHP grammar'
	'tree-sitter-python: Python grammar'
	'tree-sitter-r: R grammar'
	'tree-sitter-regex: Regex grammar'
	'tree-sitter-ruby: Ruby grammar'
	'tree-sitter-rust: Rust grammar'
	'tree-sitter-scala: Scala grammar'
	'tree-sitter-swift: Swift grammar'
	'tree-sitter-sql: SQL grammar'
	'tree-sitter-toml: TOML grammar'
	'tree-sitter-typescript: TypeScript and TSX grammar'
	'tree-sitter-verilog: Verilog grammar'
	'tree-sitter-yaml: YAML grammar'
	'tree-sitter-zig: Zig grammar')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url"
        'no_install.patch')
sha256sums=('SKIP'
            'a186c5291d498a1fe598ae06ca81491f631a25f9c7f80c42999afdb43885ef64')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	## Patching out install/uninstall functionality as this will be resolved with
	## tree-sitter-language packages
	patch -p1 -d "$pkgname" < no_install.patch
}

package() {
	cd "$pkgname"
	find autoload doc lua plugin queries \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
