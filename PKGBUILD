# Maintainer: Edsploration <edfilms at gmail>
pkgname='ttf-sometype-mono-git'
pkgdesc='Free monospaced font for coding and tabular layout'
pkgver=r189.f21476e
pkgrel=2
arch=(any)
license=(custom:OFL)
url=https://github.com/dharmatype/Sometype-Mono/
source=("${pkgname}::git+${url}#branch=master")
sha512sums=(SKIP)
conflicts=(ttf-sometype-mono)
provides=("${conflicts[@]}")
makedepends=(git)

pkgver () {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package () {
    install -m755 -d "${pkgdir}/usr/share/fonts/ttf-sometype-mono"
    install -m644 -t "${pkgdir}/usr/share/fonts/ttf-sometype-mono" "${pkgname}"/fonts/ttf/*.ttf
    install -Dm644 "${pkgname}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
