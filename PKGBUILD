# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=tomee
pkgver=9.0.0_M8
pkgrel=1
pkgdesc="Apache TomEE application server."
url="https://tomee.apache.org/"
license=("Apache")
depends=('java-environment>=8')
arch=("any")
options=(!strip)
install="${pkgname}.install"
source=("https://dlcdn.apache.org/${pkgname}/${pkgname}-${pkgver//_/-}/apache-${pkgname}-${pkgver//_/-}-plume.tar.gz"
        "${pkgname}.service"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf")

sha256sums=('ef49b3fcc7b72886b176f8dd8910608cf82c285a11290b95826a594da14601bb'
            'f647a600b1a49dc9981fc6e820c260ca09e044a9dca5a421b5441b7acabebf38'
            'd86cd28fb7c26b684eb94d8dff22d95dbe53b9e73dd2df38dfe8a75c31251875'
            '499a574b00d279741e0578e0413af5edbe336f1f9fff6f12cdb58acaef35313f')

package() {
    rm -f "apache-${pkgname}-plume-${pkgver//_/-}/bin/"*.{bat,exe}
    install -d "${pkgdir}/opt"
    cp -r "apache-${pkgname}-plume-${pkgver//_/-}" "${pkgdir}/opt/${pkgname}"
    install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname}.service"
    install -D -m 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname}"
}
# vim:set ts=4 sw=4 et:
