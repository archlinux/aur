# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-wiki-git
_pkg="${pkgname%-git}"
pkgver=0.5.r33.g113c8a5
pkgrel=1
pkgdesc="A wiki plugin for Vim"
arch=('any')
url="https://github.com/lervag/wiki.vim"
license=('MIT')
groups=('vim-plugins')
depends=('python' 'vim-plugin-runtime')
makedepends=('git')
optdepends=('vim-wiki-ft: Wiki filetype plugin'
            'pandoc: WikiExport support')
provides=("$_pkg" 'vim-ctrlp-wiki' 'vim-coc-wiki' 'vim-unite-wiki')
conflicts=("$_pkg")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()	{
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local dirs=(autoload doc plugin pythonx)
	cd "$pkgname"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
