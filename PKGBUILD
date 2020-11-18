# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=libinput-gestures-git
_pkgname=libinput-gestures
pkgver=r218.f701a8f
pkgrel=1
pkgdesc="Actions gestures on your touchpad using libinput"
arch=('any')
license=('GPL3')
url="https://github.com/bulletmark/libinput-gestures"
depends=('libinput' 'python' 'hicolor-icon-theme')
optdepends=('wmctrl: required for `_internal` command, as per default configuration'
            'xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps')
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
