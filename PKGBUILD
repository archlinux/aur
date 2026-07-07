# Maintainer: devome <evinedeng@hotmail.com>

_reponame=Stirling-PDF
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=2.14.1
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
    "imagemagick"
    "java-runtime-headless>=21"
    "libreoffice"
    "ocrmypdf"
    "poppler"
    "python-opencv"
    "python-pdf2image"
    "python-pillow"
    "python-unoserver"
    "python-weasyprint"
    "qpdf"
    "tesseract-data-eng"
    "tesseract-data-osd"
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
sha256sums=('9df8a7bd024b06c9340d662eed2a18b07da35578cb593ab23958f61a46ddbf6c'
            'a15c14eb493c697eb475dcced1938c3c935c93a00516f7915b4574fb1911fed4'
            '6f49111e3ea7d62dfbbad1f61edfd0e4b6aeb4acac51e512e4722e408869eaff'
            '55b2be2b11c1c2f1f2b50c7ac0190ef30d3b684c39689d236d25b119906d64a1'
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
