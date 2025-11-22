# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icinga-notifications"
pkgver="0.2.0"
pkgrel=1
epoch=0
pkgdesc="New and improved notifications and incident management for Icinga"
arch=(
    "x86_64"
)
url="https://github.com/Icinga/icinga-notifications"
license=("GPL-2.0-only")
groups=()
depends=()
makedepends=(
    "make"
    "go"
)
optdepends=()
conflicts=()
replaces=()
backup=(
    "etc/icinga-notifications/config.yml"
)
options=()
install="icinga-notifications.install"
changelog="icinga-notifications.changelog"
source=(
    "https://github.com/Icinga/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "icinga-notifications.sysusers"
    "icinga-notifications.service"
)
noextract=()
sha256sums=(
    "bf849735bd4dd1bf6464a12b729ed36ce6eab73b6cbf86650c0e809698bec6dd"
    "SKIP"
    "SKIP"
)



build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export sbindir="/usr/bin"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install


    install -Dm644 "${srcdir}/icinga-notifications.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/icinga-notifications.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/icinga-notifications/LICENSE"
}
