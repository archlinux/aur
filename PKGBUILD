# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

_modname=codec_opus
_modver=1.3.0
pkgname=asterisk-${_modname}
_astver=22.0
pkgver=${_astver}_${_modver}
pkgrel=1
pkgdesc="Opus Software Codec for Asterisk"
url=https://digium.com
license=(EULA)
arch=(x86_64)
source=(https://downloads.digium.com/pub/telephony/codec_opus/asterisk-${_astver}/x86-64/${_modname}-${pkgver}-${arch}.tar.gz)
sha256sums=('889e6b3d7f096c84271e9b10c1a2050382738bd2dda82e1fc76cb1e10472e20d')

package() {
	depends+=('asterisk>=22.0.0' 'asterisk<23.0.0')

	cd ${_modname}-${pkgver}-${arch}

	install -Dt "${pkgdir}"/usr/lib/asterisk/modules -m0755 codec_opus.so
	install -Dt "${pkgdir}"/usr/lib/asterisk/modules -m0755 format_ogg_opus.so

	install -dm750 "${pkgdir}"/var/lib/asterisk/{,documentation,documentation/thirdparty}
	install -Dt "${pkgdir}"/var/lib/asterisk/documentation/thirdparty -m0644 codec_opus_config-en_US.xml

	install -Dt "${pkgdir}"/usr/share/licenses/asterisk/modules/${_modname} -m0644 LICENSE
	install -Dt "${pkgdir}"/usr/share/doc/asterisk/modules/${_modname} -m0644 README
}
