# Maintainer: devome <evinedeng@hotmail.com>

_reponame=Stirling-PDF
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=2.7.2
pkgrel=1
pkgdesc="Locally hosted web application that allows you to perform various operations on PDF files"
arch=("any")
url="https://github.com/Stirling-Tools/${_reponame}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=("MIT")
backup=("etc/${_pkgname}/${_pkgname}.env")
depends=(
    "fontconfig"
    "ghostscript"
    "java-runtime-headless>=21"
    "libreoffice"
    "ocrmypdf"
    "poppler"
    "python-opencv"
    "python-pdf2image"
    "python-pillow"
    "python-unoserver"
    "python-weasyprint"
    "tesseract-data-eng"
    "unpaper"
)
optdepends=("calibre: for ebook conversion"
            "jbig2enc: for certain OCR functionality"
            "tesseract-data-chi_sim: Chinese Simplified language OCR"
            "tesseract-data-deu: German language OCR"
            "tesseract-data-fra: French language OCR"
            "tesseract-data-por: Portuguese language OCR"
            "noto-fonts: google noto ttf fonts"
            "noto-fonts-cjk: google noto Chinese/Japanese/Korean fonts"
            "noto-fonts-extra: google noto ttf fonts additional variants"
            "terminus-font: monospace bitmap font"
            "ttf-dejavu: based on the Bitstream Vera Fonts with a wider range of characters"
            "ttf-liberation: which aims at metric compatibility with Arial, Times New Roman, and Courier New"
            "ttf-libertinus: extended math fonts support"
            "ttf-ms-win11-auto: Microsoft windows 11 fonts"
            "ttf-ms-win11-auto-zh_cn: Microsoft windows 11 Chinese Simplified fonts"
            "ttf-wps-fonts: WPS office fonts")
source=("${_pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${_reponame}-with-login.jar"
        "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}.env"
        "${_pkgname}.service"
        "${_pkgname}.sh"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('f9cff221949d228a0265d31e53d29dc7e666a00c32519e198d12a836b1d6f91c'
            '5b27d8ad0073cbaa5673ba1cdb93bb0b11571d0d8a98f6629be724cd25ed7dad'
            'd1601a440ef408a93edbc8d280bd0747712a54cc461fe10a34f1c6aaf52ff84e'
            'd0ef8935451c1ef75e08b4b977289ff84892a3b12820d6e212db1c19dd6eddc9'
            '67654b2198898e23d0cf35829e83cc0585b7335b8bd7fcd9da0e4a2ce90082d6'
            'efdf233d59cf82bc331e3ea85e912e7f534ed0d821674e232e3fc827f699ef43'
            '554fbc114c32f4b81fe3b8199e936881e26b5649098c495acfd4cd77eefd2612')
noextract=("${_pkgname}-${pkgver}.jar")

package() {
    install -Dm644 "${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}.jar"
    install -Dm644 "${_pkgname}.env"           "${pkgdir}/etc/${_pkgname}/${_pkgname}.env"
    install -Dm644 "${_pkgname}.service"       "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm755 "${_pkgname}.sh"            "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.sysusers"      "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles"      "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_reponame}-${pkgver}"
    install -Dm644 LICENSE                  -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm644 *.md                     -t "${pkgdir}/usr/share/doc/${_pkgname}"

    cd "app/core/src/main/resources"
    install -Dm644 static/fonts/*.ttf       -t "${pkgdir}/usr/share/fonts/${_pkgname}"
}
