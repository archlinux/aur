# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=otf-hanken-grotesk
pkgdesc="sans serif typeface inspired by the classic grotesques"
url="https://github.com/marcologous/hanken-grotesk"
license=("OFL")
_commit="1ab416e82130b2d3ddb7710abf7ceabf07156a13"
pkgver=20240130
pkgrel=2

arch=("any")
makedepends=(
    "fontbakery"
    "gftools"
    "git"
    "python-fontmake"

    # these next two deps should be dependencies of gftools (but are not)
    "python-networkx"
    "python-ninja"
)

source=("${pkgname}::git+https://github.com/marcologous/hanken-grotesk.git#commit=${_commit}")
b2sums=("8b6dc7629c83a2f89107af9f6583978270b8691f09e8a4b07c41171eca801480c79b0d072e500f699018f4a93777f34c9dc3f54788fbf2704f4a8419fb19728a")

build() {
    cd "${srcdir}/${pkgname}/sources/"
    gftools builder config.yml
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm0644 \
        -t "${pkgdir}/usr/share/fonts/OTF/HankenGrotesk/" \
        "fonts/otf/"*.otf

    install -Dm0644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
