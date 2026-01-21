# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="rdiff-backup-fs"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="A FUSE filesystem for accessing rdiff-backup archives."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://code.google.com/archive/p/rdiff-backup-fs"
license=("GPLv3")
depends=("fuse2")
makedepends=()
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/rdiff-backup/rdiff-backup-fs/archive/v${pkgver}.tar.gz"
    "gcc15.patch"
)
sha256sums=(
    "fc1209896321e451a25e2ee389c2bab9d0be1cfee2c827b2f119200c67c0ad41"
    "e319231735e45c98997347a5c06642623cf34e108c27f760df49324916945a8d"
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    patch -Np1 -i "${srcdir}/gcc15.patch"
}

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
