# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=munt-alsadrv
_basepkgname=${pkgname%-alsadrv}
pkgdesc='Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I - ALSA sequencer driver'
pkgver=2.6.3
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
sha512sums=('638ea1dbe5340f74642536c3fd8edd3cb5bd2947db95472b739066ecb85104dddfbb3fd0d4cd2f17962e8e2546c6abf9203b08a319dde026e4c0f3e2fa32210f'
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
