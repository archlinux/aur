# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dfandinodovalo
_pkgname=ils
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, interactive file explorer for the terminal"

_github="https://github.com/${_pkgauthor}/${_pkgname}"
url="${_github}"
license=('MIT')
arch=('x86_64')

provides=("${pkgname}")

makedepends=('git' 'make' 'gcc')
depends=('glibc' 'ncurses')

options=('!debug' '!lto')

source=("${_pkgname}-${pkgver}.tgz::${_github}/archive/v${pkgver}.tar.gz" "LICENSE")
sha256sums=('753d789971b0ce5a657f94eec36f147b96ccadba2132383787a1a1bf3f31eb49'
            'edc676b7fe20e06a1c5d785bf6db356fa7d46e8156e649034185539b39920c47')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
