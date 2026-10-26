# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icingaweb2-module-map"
_module_name="map"
pkgver="2.1.0"
pkgrel=1
epoch=0
pkgdesc="An openstreetmap based map module for host and service state visualization with Icinga Web 2"
arch=("any")
url="https://github.com/nbuchwitz/icingaweb2-module-map"
license=("GPL-2.0-only")
groups=()
depends=(
    "icingaweb2"
)
makedepends=()
optdepends=(
    "icingadb-web"
    "icingaweb2-module-mapdatatype"
)
provides=()
conflicts=()
replaces=()
backup=(
    "etc/icingaweb2/modules/map/config.ini"
)
options=()
install=""
changelog="map.changelog"
source=(
    "https://github.com/nbuchwitz/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "config.ini"
)
noextract=()
sha256sums=(
    "cae215db5e02997ea8886f8c586224dad18b965350c9fade8e154e5b7c99bfe5"
    "SKIP"
)



package() {
    install -dm2770 "${pkgdir}/etc/icingaweb2"
    install -dm2770 "${pkgdir}/etc/icingaweb2/modules/${_module_name}"
    for config in config.ini
    do
        install -m660 "${config}" "${pkgdir}/etc/icingaweb2/modules/${_module_name}/${config}"
    done

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/share/webapps/icingaweb2/modules/${_module_name}/"
    for part in \
        application \
        configuration.php \
        library \
        module.info \
        public \
        run.php
    do
        cp -r "${srcdir}/${pkgname}-${pkgver}/${part}" "${pkgdir}/usr/share/webapps/icingaweb2/modules/${_module_name}/"
    done
}
