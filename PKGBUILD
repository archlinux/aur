# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=vim-monokai
pkgname=${_pkgname}-git
pkgver=r20.91b3eb3
pkgrel=2
pkgdesc='A port of the Monokai color scheme for Vim by sickill.'
arch=('any')
url='https://github.com/sickill/vim-monokai'
license=('unknown')
groups=('vim-plugins')

optdepends=(
	'vim-python3: for vim with Python 3 interpreter support'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver}")

install=${pkgname}.install

source=(
	"git+https://github.com/sickill/${_pkgname}.git"
	"${pkgname}.install"
)
sha512sums=(
	'SKIP'
	'e83b44527f9c45a81f6faed689462fdabac55d9f7ce6f3bdb08e00a344baa16d99adf0c39d278488d59595c577093d0404aacfa98563a2ee1db821d5dab3632b'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${_pkgname}
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	# Installing package
	cd ${srcdir}/${_pkgname}
	mkdir -p ${pkgdir}/usr/share/vim/vimfiles
	cp -R ./colors ${pkgdir}/usr/share/vim/vimfiles
}