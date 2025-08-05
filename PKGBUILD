# Maintainer: Donien <donien.96@hotmail.com>

pkgname="icingadb-web"
pkgver="1.2.2"
pkgrel=1
epoch=0
pkgdesc="Provides a graphical interface to your Icinga monitoring "
arch=("any")
url="https://github.com/Icinga/icingadb-web"
license=("GPL")
groups=()
depends=(
    "icingaweb2>=2.9"
    "icinga-php-library>=0.17.0"
    "icinga-php-thirdparty>=0.13.0"
)
makedepends=()
optdepends=()
provides=(
    "icingadb-web"
    "icingaweb2-module-icingadb"
)
conflicts=()
replaces=()
backup=(
    "etc/icingaweb2/modules/icingadb/commandtransports.ini"
    "etc/icingaweb2/modules/icingadb/config.ini"
    "etc/icingaweb2/modules/icingadb/redis.ini"
)
options=()
install="icingadb-web.install"
changelog="icingadb-web.changelog"
source=(
    "https://github.com/Icinga/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "commandtransports.ini"
    "config.ini"
    "redis.ini"
)
noextract=()
sha256sums=(
    "5137bb68328d6aa7baa843bc9f8f6fba21afa957d454aeeb93f97f8942b6fa74"
    "SKIP"
    "SKIP"
    "SKIP"
)



package() {
    install -dm2770 "${pkgdir}/etc/icingaweb2"
    install -dm2770 "${pkgdir}/etc/icingaweb2/modules/icingadb"
    for config in commandtransports.ini config.ini redis.ini
    do
        install -m660 "${config}" "${pkgdir}/etc/icingaweb2/modules/icingadb/${config}"
    done

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/icingadb-web/LICENSE"

    install -dm755 "${pkgdir}/usr/share/webapps/icingaweb2/modules/icingadb/"
    for part in \
        application \
        configuration.php \
        doc \
        library \
        module.info \
        public \
        run.php
    do
        cp -r "${srcdir}/${pkgname}-${pkgver}/${part}" "${pkgdir}/usr/share/webapps/icingaweb2/modules/icingadb/"
    done
}
