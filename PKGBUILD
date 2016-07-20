# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=vim-blade
pkgname=${_pkgname}-git
pkgver=r109.0af360e
pkgrel=1
pkgdesc='Blade syntax highlighting for VIM'
arch=('any')
url='https://github.com/jwalton512/vim-blade'
license=('custom:vim')
groups=('vim-plugins')

optdepends=(
	'vim: to use this plugin'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver}")

source=("git+https://github.com/jwalton512/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	# Updating package version
	cd "${srcdir}"/${_pkgname}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	# Installing package
	cd "${srcdir}"/${_pkgname}
	mkdir -p "${pkgdir}"/usr/share/vim/vimfiles
	cp -R {ftdetect,ftplugin,indent,syntax} "${pkgdir}"/usr/share/vim/vimfiles
}
