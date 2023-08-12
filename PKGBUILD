# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=0.46+13+g44223c5
pkgrel=1
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad verificador de vulnerabilidade/mitigação"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL3')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=44223c5308d14b277d9dc00a26b4333520e1261a
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        'translate-pt-br.patch')

sha256sums=('SKIP'
            '348952c5a864634f86aeeb49a36ba6d6b0047adf199d20ea5eaa0d2afd0f5fa4')

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
