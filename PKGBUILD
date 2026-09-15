# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=26.36.0913490
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

sha256sums=('4e4d209a038c252a2833eeaac18a53c5f19141e88e35a32d4d1c7bb42239d96a'
            '6b24d864a549040fc01c36153710e06ef16ddf1873bc75166e3d5872d616b6bc')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/translate-pt-br.patch"
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
