# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=bit-git
pkgver=0.5.8
pkgrel=1
pkgdesc="Bit is a modern Git CLI"
arch=("x86_64")
url="https://github.com/chriswalz/bit"
license=('Apache 2.0')
depends=(git)
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_pkgrepo="https://github.com/chriswalz/bit"
source=("${pkgname}::git+${_pkgrepo}.git#tag=v${pkgver}")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

build() {
    cd ${srcdir}/${pkgname}
    GO111MODULE=on go build

    cd bitcomplete
    GO111MODULE=on go build

    cd ..
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/licenses"

    install -Dm755 "${srcdir}/${pkgname}/bit" "${pkgdir}/usr/bin/bit"
    install -Dm755 "${srcdir}/${pkgname}/bitcomplete/bitcomplete" "${pkgdir}/usr/bin/bitcomplete"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
