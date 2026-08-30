pkgname=yamis-icon-theme-git
_pkgname=yet-another-monochrome-icon-set

pkgver=r56.284b316
pkgrel=1

pkgdesc="Yet Another Monochrome Icon Set for KDE Plasma"
arch=('any')
url="https://bitbucket.org/dirn-typo/yet-another-monochrome-icon-set"
license=('GPL-3.0-only')

depends=('hicolor-icon-theme')
makedepends=('git')

optdepends=(
    'breeze-icons: fallback icons'
    'papirus-icon-theme: fallback icons'
)

provides=('yamis-icon-theme')
conflicts=('yamis-icon-theme')

source=(
    "${_pkgname}::git+https://bitbucket.org/dirn-typo/yet-another-monochrome-icon-set.git#branch=main"
)

sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${_pkgname}"

    install -dm755 \
        "${pkgdir}/usr/share/icons/${_pkgname}"

    cp -a \
        --no-preserve=ownership \
        . \
        "${pkgdir}/usr/share/icons/${_pkgname}/"

    rm -rf \
        "${pkgdir}/usr/share/icons/${_pkgname}/.git"
}
