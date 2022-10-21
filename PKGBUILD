# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgbase=vim-candid
_pkgbase=vim-candid
pkgname=('vim-candid-git'
	'vim-lightline-candid-git')
pkgver=r86.f7198b5
pkgrel=2
arch=('any')
url="https://github.com/flrnd/candid.vim"
license=('MIT')
makedepends=('git')
source=("${_pkgbase}::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-candid-git() {
	pkgdesc="A dark colorscheme with vibrant colors."
    _pkgname=vim-candid
	depends=('vim')
	optdepends=('vim-lightline-git: for lightline color scheme'
		'md2vim: to make candid.txt help file')
    provides=("${_pkgbase}")
    conflicts=("${_pkgbase}")
    cd "${srcdir}/${_pkgbase}"
	find autoload/candid.vim colors \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	if [ -x "$(command -v md2vim)" ]; then
		md2vim README.md candid.txt
		install -Dm 644 candid.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
		rm candid.txt
	fi
}

package_vim-lightline-candid-git() {
	pkgdesc="Candid color scheme for lightline."
    depends=('vim' 'vim-candid')
	optdepends=('vim-lightline-git')
    _pkgname=vim-lightline-candid
	provides=('vim-lightline-candid')
	conflicts=('vim-lightline-candid')
    cd "${srcdir}/${_pkgbase}"
    install -Dm 644 "${srcdir}/${_pkgbase}/autoload/lightline/colorscheme/candid.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/lightline/colorscheme/candid.vim"
}
