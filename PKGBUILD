# Maintainer: Mingi Sung <dawdleming@gmail.com>

pkgname=libinput-gestures-git
_pkgname=libinput-gestures
pkgver=2.76.r0.gbbe7e79
pkgrel=2
pkgdesc="Actions gestures on your touchpad using libinput"
arch=('any')
license=('GPL3')
url="https://github.com/bulletmark/libinput-gestures"
depends=('libinput'
         'python'
         'hicolor-icon-theme'
         'gobject-introspection-runtime'
         'dbus-python'
         'python-gobject')
optdepends=('wmctrl: required for `_internal` command, as per default configuration'
            'xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.conf")
install="${pkgname}.install"
source=("${_pkgname}"::"git+https://github.com/bulletmark/${_pkgname}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="$pkgdir/" install
}
