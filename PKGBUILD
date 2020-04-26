# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.6
pkgrel=1
pkgdesc="Udev rules for controllers"
url='https://gitlab.com/Fabish/game-devices-udev'
arch=('any')
license=('MIT')
depends=('udev' 'lsb-release')
makedepends=('lsb-release')
install=${pkgname}.install
source=("https://gitlab.com/Fabish/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip"
		"uinput.conf")
sha512sums=('c12263703d1d603e013b0537ee4bda12b8e0ca084cc8300fa04a7b59d09e276bfe2701af9c709f7a90312495c2cb4b1517bf6ce91ad923423a1495c81d1c953e'
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
