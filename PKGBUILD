# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.3
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
sha512sums=('225d4021c5d2797b9aded06c71cc1ca1531744769ede8605e6eebee0b50f759c7c56a1e52ca8d5fbbbb4fa5af926b0db0bdd99bf98c46ddd077032e57398d12d')

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
