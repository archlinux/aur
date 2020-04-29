# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=prosody-mod-turncredentials-hg
_pkgname=${pkgname%-hg}
pkgdesc="XEP-0215 implementation for time-limited TURN credentials."
url="https://modules.prosody.im/mod_turncredentials"

pkgver=r3998.67047ed63b15
pkgrel=1

arch=("any")
license=("MIT")

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=(
    "mercurial"
)
depends=(
    "prosody"
)

source=("hg+https://hg.prosody.im/prosody-modules/")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/prosody-modules/"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
    # derive module name from packagename
    _modulename=${_pkgname#prosody-}
    _modulename=${_modulename//-/_}

    install \
        -Dm 0644 \
        "${srcdir}/prosody-modules/${_modulename}/${_modulename}.lua" \
        "${pkgdir}/usr/lib/prosody/modules/${_modulename}.lua"

    install \
        -Dm 0644 \
        "${srcdir}/prosody-modules/${_modulename}/README.markdown" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install \
        -Dm 0644 \
        "${srcdir}/prosody-modules/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

