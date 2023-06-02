# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="sysinfo"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="sysinfo shows system information like the hardware configuration and resource usage in a compact, clearly arranged and
visually pleasing style."
arch=("any")
url="https://github.com/IngoMeyer441/sysinfo"
license=("MIT")
depends=("bash" "gawk")
source=("https://github.com/IngoMeyer441/sysinfo/archive/v${pkgver}.tar.gz"
        "version.sh_no_phony.patch")
sha256sums=("4296928662b16c087607f1a274531c884a86444f55bbe038c5cfbed3a357c843"
            "022e579806fc6090f066489ee40a38010f7c26d9f874554e7eb7d7f5236d257f")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    patch -p1 -i "${srcdir}/version.sh_no_phony.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    sed \
        -e "s/^\(SCRIPT_VERSION=\).*$/\1\"${pkgver}\"/" \
        "src/version.template.sh" > "src/version.sh" && \
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
