# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vim-better-whitespace
pkgver=0.r71.gff3dedc
pkgrel=1
pkgdesc='Vim plugin: Better whitespace highlighting for Vim'
arch=('any')
url='https://github.com/ntpeters/vim-better-whitespace'
license=('GPL')
depends=('vim')
conflicts=('vim-trailing-whitespace')
makedepends=('git')
source=('git://github.com/ntpeters/vim-better-whitespace.git')
sha256sums=('SKIP')

pkgver() {
	cd vim-better-whitespace/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	install -D -m0644 ${srcdir}/vim-better-whitespace/plugin/better-whitespace.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/better-whitespace.vim
	install -D -m0644 ${srcdir}/vim-better-whitespace/doc/better-whitespace.txt ${pkgdir}/usr/share/doc/${pkgname}/better-whitespace.txt
}

