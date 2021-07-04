# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-tree-sitter-git
pkgver=r1469.8eb29ef
pkgrel=2
pkgdesc="Neovim tree-sitter configurations and abstraction layer"
arch=('any')
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'tree-sitter')
makedepends=('git')
optdepends=('tree-sitter-bash: Bash shell grammar'
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
            '5531574b77217a2766626ef2c05dac307e650dc830a613bada297e17abcb3e3c')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	## Patching out install/uninstall functionality as this will be resolved with
	## tree-sitter-language packages
	patch -p1 < "$srcdir/no_install.patch"
}

package() {
	cd "$pkgname"
	find after autoload doc ftdetect lua parser-info parser plugin queries \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
