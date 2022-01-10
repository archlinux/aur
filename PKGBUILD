# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=glassfish
pkgver=6.2.4
pkgrel=1
pkgdesc="The Open Source Jakarta EE (Java EE) Reference Implementation."
url="https://github.com/eclipse-ee4j/${pkgname}"
license=("EPL")
depends=('java-environment>=11')
arch=("any")
options=(!strip)
install="${pkgname}.install"
source=("${url}/releases/download/${pkgver//_/-}/${pkgname}-${pkgver//_/-}.zip"
        "${pkgname}.service"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf")

sha256sums=('3baa27b0f1aca2b18a615810ab916d3c25e90057809d4ab9a6b0cdb9a2e0d710'
            '85aaee79cf5624aec9de63662d9b37c2b95ea136472e0b47027ce71c93d069c3'
            '04aae18a2d4d66ae687a9cf144bc8775c8b903e63eea22ad0d8fb61086bcd2de'
            '44f7d2a8c63758053ee01326525cbac1ab3c04d581091d6b7b3bca4412acc10a')

package() {
    install -d "${pkgdir}/opt"
    cp -r "${pkgname}6" "${pkgdir}/opt/${pkgname}"
    install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname}.service"
    install -D -m 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname}"
}
# vim:set ts=4 sw=4 et:
