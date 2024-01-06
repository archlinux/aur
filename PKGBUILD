# Maintainer: everyx <lunt.luo#gmail.com>

pkgbase=sing-geoip
pkgname=(sing-geoip-db sing-geoip-rule-set sing-geoip-common)
pkgver=20231212
pkgrel=3

pkgdesc='sing-geoip database'
arch=('any')
url="https://github.com/SagerNet/sing-geoip"
license=('GPL3')

makedepends=(go)

_srcbase="${pkgbase}-${pkgver}"

source=("${_srcbase}.tar.gz::https://github.com/SagerNet/sing-geoip/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e1055c8190a7f79a00ce3870b4f482161483ff68ffb10ed6f7915849ec513bd9')

build() {
    cd "${_srcbase}" || exit
    go run -v .
}

package_sing-geoip-common() {
    install -Dm644 "${_srcbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_sing-geoip-db() {
    depends=(sing-geoip-common)
    replaces=(sing-geoip)

    install -dm755 "${pkgdir}/usr/share/${pkgbase}/rule-set"
    install -Dm644 "${_srcbase}/rule-set/"* "${pkgdir}/usr/share/${pkgbase}/rule-set"
}

package_sing-geoip-rule-set() {
    depends=(sing-geoip-common)

    install -dm755 "${pkgdir}/usr/share/${pkgbase}"
    install -Dm644 "${_srcbase}/"*.db "${pkgdir}/usr/share/${pkgbase}"
}
