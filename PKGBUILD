# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=munt-alsadrv
_basepkgname=${pkgname%-alsadrv}
pkgdesc='Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I - ALSA sequencer driver'
pkgver=2.5.0
pkgrel=1
arch=(x86_64)
url=http://munt.sourceforge.net
license=(GPL2)
depends=("munt>=${pkgver}-2")
install="${pkgname}.install"
source=("https://github.com/${_basepkgname}/${_basepkgname}/archive/${_basepkgname}_${pkgver//./_}.zip"
        "${pkgname}.service")
sha512sums=('f2011b108e67f4bcac93003c397db491932fb32782f39cc19001c9521983fac3622311c5574d0cf055f52d93e7c7190b7b19588a370e6e2a415984a8c44f4698'
            '178f6b478e3d88c5ccb3b60799ed398c57b75384c96c2ee91c9f95ab94b772a5b5ce7bbc87465f334e5fd3d6decf87c47d6dcea2fe22b687dc023931fa79d480')

build () {
	cd "${srcdir}/${_basepkgname}-${_basepkgname}_${pkgver//./_}/mt32emu_alsadrv"
	make mt32d
}

package () {
	cd "${srcdir}/${_basepkgname}-${_basepkgname}_${pkgver//./_}/mt32emu_alsadrv"
	install -Dm644 "${srcdir}/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm755 mt32d "${pkgdir}/usr/bin/mt32d"
	install -dm755 "${pkgdir}/usr/share/mt32-rom-data"
}
