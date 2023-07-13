# Maintainer: Rhys Perry <rhysperry111@gmail.com>
# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=komga
pkgver=1.2.0
pkgrel=1
pkgdesc='Media server for comics/mangas/BDs with API and OPDS support'
arch=(any)
url=https://komga.org
license=(MIT)
depends=('java-runtime-headless>=17')
backup=(etc/${pkgname}.conf)
install=${pkgname}.install
source=("https://github.com/gotson/komga/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gotson/komga/v${pkgver}/LICENSE"
        "${pkgname}"
        "${pkgname}.env"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('8555511e50c69926163694feaf8d340e80f51ce5fbe8ad1a875be43365e365c5'
            '0c34b357f56a8d8947e5bf153d8a02ca378611f089d8a3c371667f28c223653f'
            '79ed4053c4775286e7c534da74bb14619f93931262234e029a64eb3838ca31f7'
            'a0265a0b8ee1bc887033830c21915939efb6872337dccd5b79edb4ca9e403c1d'
            '16bde60b72dd632304e89d3c7f032555c848a7add3ad43da6640c34338320fe1'
            'afab9337acdcd5da316bf2d1615b8baed5397372a8ba917383ba480d7f30a699'
            '26347d880e10a24d3b4a17a8c6d9dc7c15cda21f50d6a07a8602ab67cd6f2d02'
            '81687c1769a6dcf0df72fed1bc23146f0a36525f8a0f2c279d31bc79b4809a0f')

package() {
    install -Dm755 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
    install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/komga.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/komga.conf"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/komga.conf"
    install -Dm644 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/komga.conf"
    install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
