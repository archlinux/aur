#Maintainer: Lothar_m <lothar_m at riseup dot net>
# Borrows heavily on vim-csv-git PKGBUILD by Andy Weidenbaum

pkgname='vim-css-color-git'
_gitname='vim-css-color'
pkgver=20200416
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.github.com/ap/vim-css-color"
depends=('vim')
#optdepends=('')
makedepends=('git')
groups=('vim-plugins')
license=('MIT')
pkgdesc="A very fast, multi-syntax context-sensitive color name highlighter."
provides=(vim-css-color-git)
conflicts=(vim-css-color)
source=(${pkgname%-git}::git+https://github.com/ap/vim-css-color)
md5sums=('SKIP')
install=vimdoc.install

pkgver() {
	cd ${pkgname%-git}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
	cd ${pkgname%-git}

	msg 'Installing documentation...'
	install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-css-color-git/README"

	msg 'Installing license...'
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-css-color-git/LICENSE"

	msg 'Installing appdirs...'
	install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
	#for _appdir in autoload compiler doc ftdetect ftplugin indent syntax; do
	for _appdir in autoload syntax after; do
		cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
	done

	msg 'Cleaning up pkgdir...'
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

