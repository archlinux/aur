# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=26.26.0404682
pkgrel=1
pkgdesc="Verificador de vulnerabilidades/mitigação para Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, Spectre e Meltdown"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL-3.0-only')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=00bb4a951c77c81a47697c40c9e5d97c926f6249
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        'translate-pt-br.patch')

sha256sums=('cc9901a6e9dc1d2a576652c9f6ccaac766a9c082b8250bada200140ee144c0c0'
            '6f365fcec616e8e2be24c18f0092c6b3e6acb023ce6c07c8b6f8ef61359cf482')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 -i "${srcdir}/translate-pt-br.patch"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _ver=$(git describe --tags | sed 's/^v//;s/-/./g')
    printf '%s' "$( cut -f1-3 -d'.' <<< ${_ver})"
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
