# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=libinput-gestures-git
_pkgname=libinput-gestures
pkgver=r112.a0df416
pkgrel=1
pkgdesc="Actions gestures on your touchpad using libinput"
arch=('any')
license=('GPL3')
url="https://github.com/bulletmark/libinput-gestures"
depends=('libinput' 'xdotool' 'python' 'wmctrl' 'hicolor-icon-theme')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
install="${pkgname}.install"
source=("${_pkgname}"::"git+https://github.com/bulletmark/${_pkgname}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^libinput-gestures-//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="$pkgdir/" install
}
