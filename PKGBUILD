# Maintainer: taotieren <admin@taotieren.com>

pkgname=qeda
pkgver=0.4.3
pkgrel=1
pkgdesc="The tool for easy creating electronic component libraries"
arch=('any')
url="https://github.com/qeda/qeda"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    nodejs
)
makedepends=(
    npm
    coffeescript
    poppler
    ghostscript
)
optdepends=(
    'kicad: Electronic schematic and printed circuit board (PCB) design tools'
    'geda-gaf: gEDA/gaf suite - Contains gschem, gnetlist, gsymcheck, gattrib, utilities and documentation from thegEDA project'
    'pcb-rnd: free/open source, flexible, modular Printed Circuit Board editor'
)
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('03288f30bccbab7cb2c49285d40b1ee9c87308b25a34cd2a0d292c49acdf5dd6')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
