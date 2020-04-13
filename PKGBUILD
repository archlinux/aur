# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_pkgname=asyncomplete-lsp.vim
pkgname=vim-asyncomplete-lsp-git
pkgver=r26.5c470ae
pkgrel=1
pkgdesc="LSP source for asyncomplete.vim vim-lsp"
arch=('any')
url="https://github.com/prabirshrestha/${_pkgname}.git"
license=('Custom')
depends=('vim' 'vim-asyncomplete-git')
groups=('vim-plugins')
source=("${_pkgname}::git+$url")
sha512sums=('SKIP')

pkgver()
{
	cd "$srcdir/$_pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir/$_pkgname"

	# TODO: Install license when available -- see https://github.com/prabirshrestha/asyncomplete-lsp.vim/issues/31
	#install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

	# Install vimfiles
	local vimfiles="$pkgdir/usr/share/vim/vimfiles"
	mkdir -p "$vimfiles"
	cp -dr --no-preserve=ownership plugin "$vimfiles"
}
