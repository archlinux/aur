# Maintainer: cstamas <cstamas at crysys dot hu>

pkgname="ttf-cousine"
# fc-query -f '%{fontversion}\n' ./Cousine-VF.ttf | perl -E 'printf "%.2f\n", <>/65536.0'
pkgver=1.23
pkgrel=1
pkgdesc="Cousine offers improved on-screen readability characteristics and the pan-European WGL character set and solves the needs of developers looking for width-compatible fonts to address document portability across platforms."
arch=("any")
url="https://github.com/googlefonts/cousine"
license=("custom:OFL")
source=(
    "https://github.com/googlefonts/cousine/raw/134dfbb9d26045ab76936f9cb9d169ef6ff743f0/fonts/ttf/hinted/variable_ttf/Cousine-VF.ttf"
    "https://raw.githubusercontent.com/googlefonts/cousine/134dfbb9d26045ab76936f9cb9d169ef6ff743f0/LICENSE"
)
sha256sums=('e385cc6e70296244212b26452f6be1038119d714e794956c01187aae325cbed5'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')

package() {
    cd "${srcdir}/"

    local ext="ttf"
    local installdir="${ext^^}"
    local fonts=("${srcdir}"/*."${ext}")

    # Install fonts
    install -d "${pkgdir}/usr/share/fonts/${installdir}"
    local font
    for font in "${fonts[@]}"; do
        install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
    done

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
