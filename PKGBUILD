_reponame=rofi-tools
_pkgname=${_reponame,,}
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Rofi extensions"
url='https://github.com/szaffarano/rofi-tools'
arch=("x86_64")
license=("MIT")
depends=(rofi wl-clipboard cliphist)
makedepends=('unzip')
provides=("${_pkgname}")
source_x86_64=(
    "https://github.com/szaffarano/${_reponame}/releases/download/v${pkgver}/${_reponame}.zip"
    "https://github.com/szaffarano/${_reponame}/archive/refs/tags/v${pkgver}.zip"
)
sha256sums_x86_64=(
    "41ce032fa9446a823dc1a835898985355066a37048f72675f6a8a78f7bd0c8ee"
    "d8daa69f8a4603f7ed548bcefd4d2943a4cd96ce9312d0eedb19ad8fd8da2ab3"
)

prepare() {
    if [ "$CARCH" != "x86_64" ]; then
        error "This package is only available for x86_64 architecture."
        exit 1
    fi
    unzip "${srcdir}"/"${_reponame}".zip -d "${srcdir}/bin"
    unzip -j "${srcdir}"/v"${pkgver}".zip "${_reponame}-${pkgver}/LICENSE" -d "${srcdir}/license"
}

package() {
    mkdir -p "$pkgdir"/usr/bin
    install "$srcdir/bin/rofi-cliphist" "$pkgdir/usr/bin/rofi-cliphist"
    install -Dm644 "$srcdir/license/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
