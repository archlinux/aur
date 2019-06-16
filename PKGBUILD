# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=vim-bash-support
pkgver=4.3
_srcid=24452
pkgrel=1
pkgdesc='BASH-IDE - Write and run BASH-scripts using menus and hotkeys. '
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=365'
license=('custom:vim')
depends=('vim-vim-support>=2.4')
optdepends=('bashdb: bash debugger')
source=("${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid")
sha256sums=('f63cd5ec6989e80618e5170f820e67a9256047426783cbbccb56aaddefdd44ae')
noextract=("${pkgname}-${pkgver}.zip")

package() {
	cd "$srcdir"
	_DESTDIR="$pkgdir"/usr/share/vim/vimfiles

	install -dm755 "${_DESTDIR}"

	bsdtar -xf ${pkgname}-${pkgver}.zip \
		--exclude "autoload/mmtemplates/core.vim" \
		--exclude "autoload/mmtemplates/config.vim" \
		--exclude "autoload/mmtemplates/wizard.vim" \
		--exclude "doc/templatesupport.txt" \
		--exclude "ftdetect/template.vim" \
		--exclude "ftplugin/template.vim" \
		--exclude "syntax/template.vim" \
		--directory "${_DESTDIR}"

	# note: exclusions should be included inside vim-vim-support

	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
