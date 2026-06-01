# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-pt-br
pkgver=26.33.0420460
pkgrel=1
pkgdesc="Verificador de vulnerabilidades/mitigação para Reptar, Downfall, Zenbleed, ZombieLoad, RIDL, Fallout, Foreshadow, Spectre e Meltdown"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL-3.0-only')
depends=('sh' 'sqlite')
makedepends=('git' 'patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
_commit=1c067add59115190e8d87313ff5899b29bff0ff3
source=("git+https://github.com/speed47/spectre-meltdown-checker.git#commit=$_commit"
        "https://gitlab.com/-/snippets/5998033/raw/main/translate-pt-br.patch")

sha256sums=('4c96749271234d56b64f9f5ca9eed917677d09dc136150c1fa5e58a2bce133eb'
            '620aa45d187c70bfc6d21679c1a65f8803bb6981380e4e6801d92a8630e2f9f9')

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
