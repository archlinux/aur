# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_pkgname=asyncomplete.vim
pkgname=vim-asyncomplete-git
pkgver=2.1.0.r27.g4be3c16
pkgrel=1
pkgdesc="Async autocompletion for Vim 8 and Neovim with timers"
arch=('any')
url="https://github.com/prabirshrestha/${_pkgname}.git"
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
conflicts=('vim-asyncomplete')
provides=('vim-asyncomplete')
source=("git+$url?signed")
sha512sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # Github key

pkgver()
{
	cd "$_pkgname"
	git describe --tags | tail --bytes +2 | sed -e 's/-/.r/' -e 's/-/./'
}

package() {
	cd "$_pkgname"

	# Install license when available
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

	# Install vimfiles
	local vimfiles="$pkgdir/usr/share/vim/vimfiles"
	mkdir -p "$vimfiles"
	cp -dr --no-preserve=ownership autoload "$vimfiles"
	cp -dr --no-preserve=ownership doc "$vimfiles"
	cp -dr --no-preserve=ownership plugin "$vimfiles"
}
