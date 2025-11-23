# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=0.46+37+g9fed5ce
pkgrel=1
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad verificador de vulnerabilidade/mitigação"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL3')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=9fed5ceb332d00b0095ec0a8c2034f5affd1b99a
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        'translate-pt-br.patch')

sha256sums=('b84473ec7e312771e43d853c203914c0363acdf3dfbcb76bd4f737b24b3b1a97'
            '4b1aec558576a0a1ca758314944df9dde5454cb1df6583f1c534577e0366a604')

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
