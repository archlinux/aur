# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=0.46+5+gcbe8ba1
pkgrel=1
pkgdesc="Verificador de vulnerabilidade/mitigação Spectre e Meltdown"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL3')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=cbe8ba10ceb1cc1dd9b3c47aa5e6338e78af99e9
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        'translate-pt-br.patch')

sha256sums=('SKIP'
            '49c0f903c1fbcd13c48e0a4fe5f16a200c80a55c8d845bead413b10c2001b1f6')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 -i "${srcdir}/translate-pt-br.patch"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
