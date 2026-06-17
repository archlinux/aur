_reponame=rofi-tools
_pkgname=${_reponame,,}
pkgname=${_pkgname}-bin
pkgver=0.4.3
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
    "29764b2ef857f895355590aa5133252048ac3dd9892d73053dda697504f397fa"
    "c3b64cfec144e1498251521525a2e257ab3c176a6f1c0491db513965a6df535f"
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
