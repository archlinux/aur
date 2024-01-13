# Maintainer: everyx <lunt.luo#gmail.com>

pkgbase=sing-geoip
pkgname=(sing-geoip-common sing-geoip-rule-set sing-geoip-db)
pkgver=20240112
pkgrel=1

pkgdesc='sing-geoip'
arch=('any')
url="https://github.com/SagerNet/sing-geoip"
license=('GPL3')

makedepends=(go)

_srcbase="${pkgbase}-${pkgver}"

source=("${_srcbase}.tar.gz::https://github.com/SagerNet/sing-geoip/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d3277611a2f0f4657c1bf4cb402543892d05155d481ee4e04b1c0ecc473df3fa')

build() {
    cd "${_srcbase}" || exit
    NO_SKIP=true go run -v .
}

package_sing-geoip-common() {
    pkgdesc='sing-geosite (common files)'

    install -Dm644 "${_srcbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_sing-geoip-rule-set() {
    pkgdesc='sing-geoip (rule sets)'
    depends=(sing-geoip-common)
    provides=(sing-geoip)

    install -dm755 "${pkgdir}/usr/share/${pkgbase}/rule-set"
    install -Dm644 "${_srcbase}/rule-set/"* "${pkgdir}/usr/share/${pkgbase}/rule-set"
}

package_sing-geoip-db() {
    pkgdesc='sing-geoip (database)'
    depends=(sing-geoip-common)
    provides=(sing-geoip)
    replaces=(sing-geoip)

    install -dm755 "${pkgdir}/usr/share/${pkgbase}"
    install -Dm644 "${_srcbase}/"*.db "${pkgdir}/usr/share/${pkgbase}"
}
