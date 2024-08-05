# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=0.46+29+g34c6095
pkgrel=1
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad verificador de vulnerabilidade/mitigação"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL3')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=34c6095912d115551f69435a55d6e0445932fdf9
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        'translate-pt-br.patch')

sha256sums=('fee2ea23d9e11743dcc4f06d916fba6b9b0526e84a5f514fdc495498404158d5'
            '2a3efabcd2d75d9a4ac4a411f55b539f58d673fbd10c3d9d6a82e83a392656aa')

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
