# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=vim-qml
pkgname=${_pkgname}-git
pkgver=r17.fba69d1
pkgrel=1
pkgdesc='QML syntax highlighting for VIM'
arch=('any')
url='https://github.com/peterhoeg/vim-qml'
license=('unknown')
groups=('vim-plugins')

optdepends=(
	'vim-python3: for vim with Python 3 interpreter support'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver}")

source=("git+https://github.com/peterhoeg/${_pkgname}.git")
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
	cp -R ./{ftdetect,ftplugin,indent,syntax} "${pkgdir}"/usr/share/vim/vimfiles
}
