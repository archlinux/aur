# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgbase=tomorrow-theme
pkgname=("${pkgbase}-vim-git" "${pkgbase}-qtcreator-git" "${pkgbase}-gedit-git")
pkgver=r429.0e0d35a
pkgrel=3
arch=('any')
license=('MIT')
url='https://github.com/chriskempson/tomorrow-theme'
makedepends=('git')
source=('git+https://github.com/chriskempson/tomorrow-theme.git')
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd "${srcdir}"/${pkgbase}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/^v//;s/-/./g' ||
		printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package_tomorrow-theme-vim-git() {
	pkgdesc='Tomorrow Theme for Vim. Development version.'
	groups=("${pkgbase}-git" 'vim-plugins')
	optdepends=('vim: to use this color scheme')
	conflicts=('vim-tomorrow-theme-git')
	provides=("${pkgbase}-vim-git=${pkgver}")
	
	# Install vim colorscheme
	mkdir -p "${pkgdir}"/usr/share/vim/vimfiles
	cp -R "${srcdir}"/${pkgbase}/vim/colors "${pkgdir}"/usr/share/vim/vimfiles/
}

package_tomorrow-theme-qtcreator-git() {
	pkgdesc='Tomorrow Theme for Qt Creator. Development version.'
	groups=("${pkgbase}-git")
	optdepends=('qtcreator: to use this style')
	provides=("${pkgbase}-qtcreator-git=${pkgver}")
	
	# Install qtcreator style
	mkdir -p "${pkgdir}"/usr/share/qtcreator
	cp -R "${srcdir}"/${pkgbase}/QtCreator/styles "${pkgdir}"/usr/share/qtcreator/
}

package_tomorrow-theme-gedit-git() {
	pkgdesc='Tomorrow Theme for gedit. Development version.'
	groups=("${pkgbase}-git")
	optdepends=('gedit: to use this style')
	provides=("${pkgbase}-gedit-git=${pkgver}")
	
	# Install gedit style
	mkdir -p "${pkgdir}"/usr/share/gtksourceview-3.0/styles
	cp -R "${srcdir}"/${pkgbase}/GEdit/*.xml "${pkgdir}"/usr/share/gtksourceview-3.0/styles/
}