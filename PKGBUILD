# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="rdiff-backup-fs"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="A FUSE filesystem for accessing rdiff-backup archives."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://code.google.com/archive/p/rdiff-backup-fs"
license=("GPLv3")
depends=("fuse2")
makedepends=()
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/rdiff-backup/rdiff-backup-fs/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    "5e01a4bbf2f3aa525aefd02e795096ac6aef2ee4252c490729aa93d4899ba057"
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    autoreconf -vfi && \
    ./configure --prefix=/usr && \
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" install
}
