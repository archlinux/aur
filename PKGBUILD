# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>
pkgname=payara
pkgver=6.2022.2
pkgrel=1
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=('java-environment>=11')
arch=("any")
options=(!strip)
install="${pkgname}.install"
source=("https://search.maven.org/remotecontent?filepath=fish/${pkgname}/distributions/${pkgname}/${pkgver}/${pkgname}-${pkgver}.zip"
        "${pkgname}.service"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf")

sha256sums=('efc66a41fcf1a72fb229040a3b593f67ac006cc22d9bc2f099108991be62dc1c'
            'ae84891616d6a4bd6a7059c707f81598340d4cb8369bb4fe9d922cf3f997cdfb'
            'a0d04db70b87b1105bc762d23e49b527ec94bd21ea78bf9c56d54343a8711dfb'
            'd04df28962fa7b033b0767846e424b7ea9537530afd7006a75505e318ec28b35')

package() {
	install -d ${pkgdir}/opt
	cp -r "${pkgname}${pkgver:0:1}" "${pkgdir}/opt/${pkgname}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname}.service"
	install -D -m 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname}"
}
# vim:set ts=4 sw=4 et:
