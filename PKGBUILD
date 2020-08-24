# vim-man

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-man-git
_pkgname=${pkgname%-*}
pkgver=v0.1.0.r30.gcfdc78f
pkgrel=1
pkgdesc='View man pages in vim. Grep for the man pages.'
arch=('any')
url='https://github.com/vim-utils/vim-man'
license=('custom')
depends=('vim')
source=(
	"git+https://github.com/vim-utils/$_pkgname"
	'https://raw.githubusercontent.com/vim/vim/master/LICENSE'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"
	licenses="$pkgdir/usr/share/licenses"

	cd "$srcdir/$_pkgname"
	install -dv "$vimfiles"
	cp -R autoload doc ftplugin plugin syntax test "$vimfiles/"
	install -Dvm644 "$srcdir/LICENSE" "$licenses/$_pkgname/LICENSE"
}

