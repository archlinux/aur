# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=vim-monokai
pkgname=${_pkgname}-git
pkgver=r27.2b40c36
pkgrel=2
pkgdesc='A port of the Monokai color scheme for Vim by sickill.'
arch=('any')
url='https://github.com/sickill/vim-monokai'
license=('MIT')
groups=('vim-plugins')

optdepends=(
	'vim-python3: for vim with Python 3 interpreter support'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver}")

install=${pkgname}.install

source=("git+https://github.com/sickill/${_pkgname}.git")
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
	cp -R colors "${pkgdir}"/usr/share/vim/vimfiles

	# Install licence
	mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
	cp LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
