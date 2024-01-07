# Maintainer: everyx <lunt.luo#gmail.com>

_pkgbase=sing-geosite
pkgbase=${_pkgbase}-git
pkgname=("${_pkgbase}-common-git" "${_pkgbase}-rule-set-git" "${_pkgbase}-db-git")
pkgver=20240104053246.r0.gfc71b5c
pkgrel=2

pkgdesc='sing-geosite'
arch=('any')
url="https://github.com/SagerNet/sing-geosite"
license=('GPL3')

makedepends=(go git)

source=("git+https://github.com/SagerNet/sing-geosite.git")
sha256sums=(SKIP)

pkgver() {
  cd sing-geosite && git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd ${_pkgbase} && NO_SKIP=true go run -v .
}

package_sing-geosite-common-git() {
    pkgdesc='sing-geosite (common files)'
    provides=(sing-geosite-common)
    conflicts=(sing-geosite-common)

    install -Dm644 "sing-geosite/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

package_sing-geosite-rule-set-git() {
    pkgdesc='sing-geosite (rule sets)'
    depends=(sing-geosite-common-git)
    provides=(sing-geosite sing-geosite-rule-set)
    conflicts=(sing-geosite-rule-set)


    install -dm755 "${pkgdir}/usr/share/${_pkgbase}/rule-set"
    install -Dm644 "sing-geosite/rule-set/"* "${pkgdir}/usr/share/${_pkgbase}/rule-set"
}

package_sing-geosite-db-git() {
    pkgdesc='sing-geosite (database)'
    depends=(sing-geosite-common-git)
    provides=(sing-geosite sing-geosite-db)
    conflicts=(sing-geosite-db)
    replaces=(sing-geosite-git)

    install -dm755 "${pkgdir}/usr/share/${_pkgbase}"
    install -Dm644 "sing-geosite/"*.db "${pkgdir}/usr/share/${_pkgbase}"
}
