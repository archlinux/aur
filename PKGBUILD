# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

_pkgname=vim-lsp-ultisnips
pkgname=${_pkgname}-git
pkgver=r19.494cd3c
pkgrel=1
pkgdesc="UltiSnips integration with vim-lsp"
arch=('any')
url="https://github.com/thomasfaingnaert/${_pkgname}.git"
license=('custom:BSD-3-Clause')
provides=( "${_pkgname}" )
depends=('vim' 'vim-lsp-git')
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
	cp -dr --no-preserve=ownership plugin "$vimfiles"
}
