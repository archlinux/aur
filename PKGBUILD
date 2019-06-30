# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.4
pkgrel=0
pkgdesc="Udev rules for controllers"
url='https://gitlab.com/Fabish/game-devices-udev'
arch=('any')
license=('MIT')
depends=('systemd')
replaces=('steam-devices')
conflicts=('steam-devices')
provides=('steam-devices')
install=${pkgname}.install
source=("https://gitlab.com/Fabish/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=('384c9b6681c78e00acba2864f1e4dc69ee84ba7c7022b85164f05f82e4f20d8b03eeb5040a375f43271c76b93816c7f0d88a02ca40ab2d4b345e673d84b8c9ba')

package()
{
	# install license
	install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install udev rules
    install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
    cp "${srcdir}/${pkgname}-${pkgver}"/*.rules \
    "${pkgdir}/usr/lib/udev/rules.d/"
    
    # start uinput at boot
    install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/uinput.conf" \
    "${pkgdir}/usr/lib/modules-load.d/uinput.conf"
}
