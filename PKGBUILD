# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=rexuiz-bytecode-git
pkgver=r934.ea1d95f
pkgrel=1
arch=('any')
pkgdesc="An updated fork of Nexuiz, a fast-paced multiplayer first-person shooter (game bytecode)."
url="http://rexuiz.top/"
license=("GPL2")
depends=()
makedepends=(
    'make'
    'rmqcc-git'
    'zip'
)
optdepends=()
conflicts=('rexuiz-bytecode')
provides=('rexuiz-bytecode')
source=("qc::git+https://github.com/kasymovga/1vs1")
sha256sums=('SKIP')

# Prevent compressing final package
PKGEXT='.pkg.tar'

build() {
    cd "${srcdir}/qc"
    make SV_PROGNAME=progs.dat CL_PROGNAME=csprogs.dat CFG_NAME=rexuiz-extra.cfg SET_CURL_PACKAGE=no || return 1
    zip "${srcdir}/11-rexuiz-bytecode.pk3" {progs,csprogs,menu}.dat rexuiz-extra.cfg
}

package() {
    cd "${srcdir}"
    install -Dm644 11-rexuiz-bytecode.pk3 "${pkgdir}/usr/share/rexuiz/data/11-rexuiz-bytecode.pk3"
}

pkgver() {
    cd "${srcdir}/qc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
