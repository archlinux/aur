# Maintainer: ResinDrake <resin@resindrake.net>
pkgname=kde5-wallpaper-daynight-git
_pkgname=kde5-wallpaper-daynight
pkgver=19.10.02.b.r0.g0bc26b8
pkgrel=1
pkgdesc="A script that allows users to change their wallpaper in KDE Plasma based on the time of day."
url="https://github.com/ResinDrake/kde5-wallpaper-daynight"
license=('MIT')
depends=('bash')
makedepends=('git')
arch=('any')
source=("git://github.com/ResinDrake/$_pkgname.git")
md5sums=('SKIP')



pkgver() {
 	cd "${srcdir}/${_pkgname}"
 	git describe --tags --long | sed '
        s/^v//
        s/\([^-]*-g\)/r\1/
        y/-/./
    '
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/etc/systemd/system/"
	mkdir -p "${pkgdir}/etc/default/daynight/"

	install -Dm755 wallpaper "${pkgdir}/usr/bin/"
	install -Dm644 daynight@.* "${pkgdir}/etc/systemd/system/"
	install -Dm644 daynightrc "${pkgdir}/etc/default/daynight/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
