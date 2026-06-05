# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=26.36.0602723
pkgrel=1
pkgdesc="Verifique a resiliência do sistema contra vulnerabilidades de execução transitória (CVEs) publicadas desde 2018"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL-3.0-only')
depends=('sh' 'sqlite')
makedepends=('patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/speed47/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://gitlab.com/-/snippets/5998033/raw/main/translate-pt-br.patch")

sha256sums=('9595c721dfe33580f0a55fed382792c6100395b1cb12158867f2f1ad31adc924'
            'bd797bbd1d3c9d5388b2001a12651352126a3b1711615d7e983a06107b908b29')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/translate-pt-br.patch"
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
