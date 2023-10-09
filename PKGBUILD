# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="sysinfo"
pkgver="0.1.3"
pkgrel="2"
pkgdesc="sysinfo shows system information like the hardware configuration and resource usage in a compact, clearly arranged and
visually pleasing style."
arch=("any")
url="https://github.com/IngoMeyer441/sysinfo"
license=("MIT")
depends=("bash" "gawk")
conflicts=("xfce4-sysinfo")
source=("https://github.com/IngoMeyer441/sysinfo/archive/v${pkgver}.tar.gz"
        "version.sh_no_phony.patch")
sha256sums=("7ffe3c2a3897222aa53b6c279c9d93c4fb7227710c3f88b09a4f05d8a52fbabb"
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
