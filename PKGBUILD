# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=steam-devices-git
pkgver=v1.0.0.61.r44.1344348
pkgrel=1
pkgdesc="List of devices Steam and SteamVR will want read/write permissions on. Useful when using the Flatpak version of Steam."
arch=('any')
url="https://github.com/ValveSoftware/steam-devices"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'steam')
source=('git+https://github.com/ValveSoftware/steam-devices.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm644 *.rules -t "${pkgdir}/usr/lib/udev/rules.d"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
