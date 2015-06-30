# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vim-trailing-whitespace
pkgver=1.0.r5.g0c79bd5
pkgrel=1
pkgdesc='Vim plugin: Highlights trailing whitespace in red and provides :FixWhitespace to fix it'
arch=('any')
url='https://github.com/bronson/vim-trailing-whitespace'
license=('GPL')
depends=('vim')
conflicts=('vim-better-whitespace')
makedepends=('git')
source=('git://github.com/bronson/vim-trailing-whitespace.git')
sha256sums=('SKIP')

pkgver() {
	cd vim-trailing-whitespace/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	install -D -m0644 ${srcdir}/vim-trailing-whitespace/plugin/trailing-whitespace.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/trailing-whitespace.vim
	install -D -m0644 ${srcdir}/vim-trailing-whitespace/doc/trailing-whitespace.txt ${pkgdir}/usr/share/doc/${pkgname}/trailing-whitespace.txt
}

