# neovim-man

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=neovim-man-git
_pkgname=${pkgname%-*}
pkgver=v0.1.0.r30.gcfdc78f
pkgrel=1
pkgdesc='View man pages in neovim. Grep for the man pages.'
arch=('any')
url='https://github.com/vim-utils/vim-man'
license=('custom')
depends=('neovim')
source=(
	"$_pkgname::git+https://github.com/vim-utils/vim-man"
	'https://raw.githubusercontent.com/vim/vim/master/LICENSE'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	runtime="$pkgdir/usr/share/nvim/runtime"
	licenses="$pkgdir/usr/share/licenses"

	cd "$srcdir/$_pkgname"
	install -dv "$runtime"
	cp -R autoload doc ftplugin plugin syntax "$runtime/"
	install -Dvm644 "$srcdir/LICENSE" "$licenses/$_pkgname/LICENSE"
}

