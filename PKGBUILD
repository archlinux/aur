# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=munt-alsadrv
_basepkgname=${pkgname%-alsadrv}
pkgdesc='Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I - ALSA sequencer driver'
pkgver=2.5.3
pkgrel=1
arch=(x86_64)
url=http://munt.sourceforge.net
license=(GPL2)
depends=("munt>=${pkgver}")
install="${pkgname}.install"
__mt32suffix=libmt32emu
source=("https://github.com/${pkgname}/${pkgname}/archive/${__mt32suffix}_${pkgver//./_}.zip")
source=("https://github.com/${_basepkgname}/${_basepkgname}/archive/${__mt32suffix}_${pkgver//./_}.zip"
        "${pkgname}.service")
sha512sums=('a8a9c3698b37e1417952801574ae1b9a2f6ca9b27c9322a2b54ba7dc42d275509e2fbc1a713a0f249f0ef39d95d98f0eb16ba62f9923ff8a6cbf10fbd239b718'
            '178f6b478e3d88c5ccb3b60799ed398c57b75384c96c2ee91c9f95ab94b772a5b5ce7bbc87465f334e5fd3d6decf87c47d6dcea2fe22b687dc023931fa79d480')

build () {
	cd "${srcdir}/${_basepkgname}-${__mt32suffix}_${pkgver//./_}/mt32emu_alsadrv"
	make mt32d
}

package () {
	cd "${srcdir}/${_basepkgname}-${__mt32suffix}_${pkgver//./_}/mt32emu_alsadrv"
	install -Dm644 "${srcdir}/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm755 mt32d "${pkgdir}/usr/bin/mt32d"
	install -dm755 "${pkgdir}/usr/share/mt32-rom-data"
}
