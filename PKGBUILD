# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

_modver=1.3.0
pkgname=asterisk-codec_opus
_astver=23.0
pkgver=${_astver}_${_modver}
pkgrel=1
pkgdesc="Opus Software Codec for Asterisk"
url=https://digium.com
license=(LicenseRef-Digium-EULA)
arch=(x86_64)
source=(https://downloads.digium.com/pub/telephony/codec_opus/asterisk-${_astver}/x86-64/codec_opus-${pkgver}-x86_64.tar.gz)
sha256sums=('bb0f1dd87c716686be9b23facf60b3265018c0550b4202add07ae7a028bfaa1f')

package() {
	depends+=('asterisk>=23.0.0' 'asterisk<24.0.0')

	cd codec_opus-${pkgver}-x86_64

	install -Dt "${pkgdir}"/usr/lib/asterisk/modules -m0755 codec_opus.so
	install -Dt "${pkgdir}"/usr/lib/asterisk/modules -m0755 format_ogg_opus.so

	install -dm0750 "${pkgdir}"/var/lib/asterisk/{,documentation,documentation/thirdparty}
	install -Dt "${pkgdir}"/var/lib/asterisk/documentation/thirdparty -m0644 codec_opus_config-en_US.xml

	install -Dt "${pkgdir}"/usr/share/licenses/asterisk/modules/codec_opus -m0644 LICENSE
	install -Dt "${pkgdir}"/usr/share/doc/asterisk/modules/codec_opus -m0644 README
}
