# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgbase=tomorrow-theme
pkgname=("${pkgbase}-vim-git" "${pkgbase}-qtcreator-git")
pkgver=429.0e0d35a
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/chriskempson/tomorrow-theme'
makedepends=('git')
source=('git+https://github.com/chriskempson/tomorrow-theme.git')
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd ${srcdir}/${pkgbase}
	(
		set -o pipefail
		git describe --long --tags | sed -r 's/^v//;s/-/./g' ||
		printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package_tomorrow-theme-vim-git() {
	pkgdesc='Tomorrow theme for Vim. Development version.'
	depends=('vim')
	conflicts=('vim-tomorrow-theme-git')
	provides=("${pkgbase}-vim-git=${pkgver}")
	
	# Install vim colorscheme
	mkdir -p ${pkgdir}/usr/share/vim/vimfiles
	cp -R ${srcdir}/${pkgbase}/vim/colors ${pkgdir}/usr/share/vim/vimfiles/
}

package_tomorrow-theme-qtcreator-git() {
	pkgdesc='Tomorrow theme for Vim. Development version.'
	depends=('qtcreator')
	provides=("${pkgbase}-qtcreator-git=${pkgver}")
	
	# Install qtcreator style
	mkdir -p ${pkgdir}/usr/share/qtcreator
	cp -R ${srcdir}/${pkgbase}/QtCreator/styles ${pkgdir}/usr/share/qtcreator/
}