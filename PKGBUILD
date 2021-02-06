# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_pkgname=asyncomplete-lsp.vim
pkgname=vim-asyncomplete-lsp-git
pkgver=r30.684c344
pkgrel=1
pkgdesc="LSP source for asyncomplete.vim vim-lsp"
arch=('any')
url="https://github.com/prabirshrestha/${_pkgname}.git"
license=('MIT')
depends=('vim' 'vim-asyncomplete')
makedepends=('git')
groups=('vim-plugins')
source=("git+$url")
sha512sums=('SKIP')

pkgver()
{
	cd "$_pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$_pkgname"

	# Install vimfiles
	local vimfiles="$pkgdir/usr/share/vim/vimfiles"
	mkdir -p "$vimfiles"
	cp -dr --no-preserve=ownership plugin "$vimfiles"
}
