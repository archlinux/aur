# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=Taskwire
_pkgauthor=majoraexp
_pkgname=taskwire

pkgname=${_pkgname}-bin
pkgver=1.55
pkgrel=1
pkgdesc="Modern Linux System Monitor"

arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_appname}/v${pkgver}"
license=('GPL-3.0')

conflicts=("${_pkgname}")
depends=('glibc' 'zlib')
provides=("${_appname}")

options=(!strip)

source=("${_pkgname}.desktop"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "${_pkgname}-${pkgver}.png::${_urlraw}/${_appname}/app_icon.png")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_appname}")

sha256sums=('99afca95edd7d783972c0c9ba84a0bd8dc06327c066b5abc738b987e75f36ae3'
            'ab57324b3ea51d1c3ecc4706fa8783f06994d2fa4581a6d27b7cc7e57048c71c'
            '12bafa0b99f0d1c41adc9b946557eef64dfe997ec39da78cde1679752bdead95'
            '3e797e8cc15333328259c2d675c7feededb7c16710ace0f6ba4727643e634b83')
sha256sums_x86_64=('db5c37e427f6e11445da47dda5f2c5fc13e56cdbb6c370b1152cf0a11e7cde40')


package() {
    cd "${pkgdir}"

    # install executable
    install -Dm755 "${srcdir}/${_pkgname}-${CARCH}-${pkgver}" "./usr/bin/${_appname}"

    # install app_icon
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.png" "./usr/share/icons/${_appname}.png"

    # install desktop entry
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "./usr/share/applications/${_appname}.desktop"

    # install LICENSE and README.md
    install -Dm644 "${srcdir}/README-${pkgver}.md" "./usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "./usr/share/licenses/${pkgname}/LICENSE"
} 
