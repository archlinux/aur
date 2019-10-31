# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.5
pkgrel=0
pkgdesc="Udev rules for controllers"
url='https://gitlab.com/Fabish/game-devices-udev'
arch=('any')
license=('MIT')
depends=('systemd')
install=${pkgname}.install
source=("https://gitlab.com/Fabish/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=('721c47554928d6159d4285e94f0057cec8d1d748f3e965352de1fac3ad5003b4f4a52cd8e27798b5498ff344c4428fcb1ed06401ceeb9e144e68ea492a330f06')

package()
{
	if /usr/bin/pacman -Qq manjaro-system > /dev/null 2>&1 ; then exit 1;	fi
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
