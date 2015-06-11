#Maintainer: Lothar_m <lothar_m at riseup dot net>
# Borrows heavily on vim-csv-git PKGBUILD by Andy Weidenbaum

pkgname='vim-ledger-git'
_gitname='vim-ledger'
pkgver=30.r0.g2bfbe22
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.github.com/ledger/vim-ledger"
depends=('vim')
#optdepends=('')
makedepends=('git')
groups=('vim-plugins')
license=('GPL')
pkgdesc="Vim filetype plugin for ledger files."
provides=(vim-ledger)
conflicts=(vim-ledger)
source=(${pkgname%-git}::git+https://github.com/ledger/vim-ledger)
md5sums=('SKIP')
install=vimdoc.install

pkgver() {
	cd ${pkgname%-git}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
	cd ${pkgname%-git}

	msg 'Installing documentation...'
	install -Dm 644 README.mkd "$pkgdir/usr/share/doc/vim-ledger/README"

	msg 'Installing appdirs...'
	install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
	for _appdir in autoload compiler doc ftdetect ftplugin indent syntax; do
	cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
	done

	msg 'Cleaning up pkgdir...'
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

