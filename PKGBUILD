# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.7
pkgrel=0
pkgdesc="Udev rules for controllers"
url='https://gitlab.com/Fabish/game-devices-udev'
arch=('any')
license=('MIT')
depends=('udev' 'lsb-release')
makedepends=('lsb-release')
install=${pkgname}.install
source=("https://gitlab.com/Fabish/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip"
		"uinput.conf")
sha512sums=('f6b2b25dee9e46d0f7d7df45d2b82c652117547404f99b50e3319eb331470c543d465db09a15f86fd3eb0e84b61564a211c54ae05cb4ca9813d3f2b6abf6c1d3'
            'a9b069ed121ffeee887e0583d8cb46035ecf1fa90a26a4ecb3aa11ff03178b2b08621f6676db6b2350f290694c04aabcf36f2ce3e0813a76dde9a33555edb112')
if [[ $(lsb_release -is) != "Arch" ]] ; then exit 1; fi

package() {
	# install license
	install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install udev rules
    install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
    cp "${srcdir}/${pkgname}-${pkgver}"/*.rules \
    	"${pkgdir}/usr/lib/udev/rules.d/"

	# start uinput at boot
    install -Dm 644 "${srcdir}/uinput.conf" \
    	"${pkgdir}/usr/lib/modules-load.d/uinput.conf"
}
