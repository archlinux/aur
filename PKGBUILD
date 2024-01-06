# Maintainer: everyx <lunt.luo#gmail.com>

pkgbase=sing-geosite
pkgname=(sing-geosite-db sing-geosite-rule-set sing-geosite-common)
pkgver=20240105034708
pkgrel=2

pkgdesc='sing-geosite'
arch=('any')
url="https://github.com/SagerNet/sing-geosite"
license=('GPL3')

makedepends=(go)

_srcbase="${pkgbase}-${pkgver}"

source=("${_srcbase}.tar.gz::https://github.com/SagerNet/sing-geosite/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b4101866d5559596f072aae952cff82758e3a1be1cfae9e55d086d97d5d9413d')

build() {
    cd "${_srcbase}" || exit
    NO_SKIP=true go run -v .
}

package_sing-geosite-common() {
    pkgdesc='sing-geosite (common files)'
    install -Dm644 "${_srcbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_sing-geosite-rule-set() {
    pkgdesc='sing-geosite (rule sets)'
    depends=(sing-geosite-common)

    install -dm755 "${pkgdir}/usr/share/${pkgbase}/rule-set"
    install -Dm644 "${_srcbase}/rule-set/"* "${pkgdir}/usr/share/${pkgbase}/rule-set"
}

package_sing-geosite-db() {
    pkgdesc='sing-geosite (database)'
    depends=(sing-geosite-common)
    replaces=(sing-geosite)

    install -dm755 "${pkgdir}/usr/share/${pkgbase}"
    install -Dm644 "${_srcbase}/"*.db "${pkgdir}/usr/share/${pkgbase}"
}