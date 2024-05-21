# Maintainer: physkets <physkets at tutanota dot com>
# Contributor: Repentinus <aur at repentinus dot eu>
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=neovim-colors-solarized-truecolor-only-git
pkgver=20161106
pkgrel=1
pkgdesc="Precision colors for machines and people."
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('MIT')
makedepends=('git')
depends=('neovim')
conflicts=('vim-solarized' 'vim-colors-solarized-git')
provides=('vim-solarized')
source=("$pkgname::git+https://github.com/frankier/neovim-colors-solarized-truecolor-only.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	local _tmpver="$(git log -n 1 --format="%cd" --date=short)"
	echo "${_tmpver//-/}"
}

package() {
	cd "$srcdir/$pkgname"

	install -dm755 "$pkgdir/usr/share/vim/vimfiles/"{plugin,bitmaps,colors,doc}

	install -Dm644 autoload/*           "$pkgdir/usr/share/vim/vimfiles/plugin/"
	install -Dm644 bitmaps/*            "$pkgdir/usr/share/vim/vimfiles/bitmaps/"
	install -Dm644 colors/*             "$pkgdir/usr/share/vim/vimfiles/colors/"
	install -Dm644 doc/solarized.txt    "$pkgdir/usr/share/vim/vimfiles/doc/"

	sed -nE '/^Copyright \(c\) 2011 Ethan Schoonover$/,$ p' README.mkd > LICENCE
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
}
