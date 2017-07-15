# Maintainer: koneu <koneu93 at googlemail dot com>

pkgname='power.sh'
pkgver='5'
pkgrel=2
pkgdesc='tiny automated power settings'
license=('CC0')
source=('power.sh' 'power.sh.rules' 'power.sh.service' 'power.sh.sleep.service')
depends=('systemd' 'sh' 'findutils')
arch=('any')
md5sums=('88a44b488f8a86e30168ecbf2164adb1'
         '8e6f9e2586f43e9031df9c65e0643c96'
         '1a16e384fee99a45f8fc59eaaa71d8f6'
         '07a8380291782b467d60bc6b78769120')

package() {
	install -Dm755 "${srcdir}/power.sh" "${pkgdir}/usr/share/power.sh"
	install -Dm644 "${srcdir}/power.sh.rules" "${pkgdir}/usr/lib/udev/rules.d/power.sh.rules"
	install -Dm644 "${srcdir}/power.sh.service" "${pkgdir}/usr/lib/systemd/system/power.sh.service"
	install -Dm644 "${srcdir}/power.sh.sleep.service" "${pkgdir}/usr/lib/systemd/system/power.sh.sleep.service"
	mkdir "${pkgdir}/usr/lib/systemd/system/sleep.target.wants"
	ln -s "/usr/lib/systemd/system/power.sh.sleep.service" "${pkgdir}/usr/lib/systemd/system/sleep.target.wants/power.sh.sleep.service"
}
