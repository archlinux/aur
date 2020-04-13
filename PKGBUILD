# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_pkgname=asyncomplete.vim
pkgname=vim-asyncomplete-git
pkgver=r170.5713fa6
pkgrel=1
pkgdesc="Async autocompletion for Vim 8 and Neovim with timers"
arch=('any')
url="https://github.com/prabirshrestha/${_pkgname}.git"
license=('MIT')
depends=('vim')
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

	# Install license when available
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

	# Install vimfiles
	local vimfiles="$pkgdir/usr/share/vim/vimfiles"
	mkdir -p "$vimfiles"
	cp -dr --no-preserve=ownership autoload "$vimfiles"
	cp -dr --no-preserve=ownership doc "$vimfiles"
	cp -dr --no-preserve=ownership plugin "$vimfiles"
}
