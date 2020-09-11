# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.7.9
pkgrel=1
pkgdesc="Udev rules for controllers"
url='https://gitlab.com/fabis_cafe/game-devices-udev'
arch=('any')
license=('MIT')
depends=('udev' 'lsb-release')
makedepends=('lsb-release')
install=$(/usr/bin/tail -n 1 /usr/lib/os-release | /usr/bin/cut -d= -f2).install
source=("https://gitlab.com/fabis_cafe/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip"
		"uinput.conf")
sha512sums=('ec48291810c9e219708aa03507ca70b34b0e378f9fda678e086cc964b3bffd1234c1105ee704ca645840adfb7b7553c494000756500641a6c1b58d35fbf1f898'
            'a9b069ed121ffeee887e0583d8cb46035ecf1fa90a26a4ecb3aa11ff03178b2b08621f6676db6b2350f290694c04aabcf36f2ce3e0813a76dde9a33555edb112')

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
