# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-srcery-git
pkgver=1.0.0.r10.g9a34db8
pkgrel=1
pkgdesc="Dark colorscheme with contrasting colors and a slightly earthy tone"
arch=('any')
url="https://github.com/srcery-colors/srcery-vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-srcery' 'vim-airline-srcery' 'vim-lightline-srcery' 'vim-clap-srcery')
conflicts=('vim-srcery')
replaces=('vim-airline-srcery-git' 'vim-lightline-srcery-git' 'vim-clap-srcery-git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload colors doc -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
