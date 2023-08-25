# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=0.46+20+g9b7b09a
pkgrel=1
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad verificador de vulnerabilidade/mitigação"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL3')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=9b7b09ada3caf56c1e6169a1240909010f5c8e49
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        'translate-pt-br.patch')

sha256sums=('SKIP'
            'b548697ec3d7fc028e414a6475b96e8488384ee0ecbf2d889f9adcdd70b34366')

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
