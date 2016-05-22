# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=2.0.3
pkgrel=3
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('MIT')
depends=(
    'php>=5.3.3'
    'php-gd'
    'php-tidy'
    'pcre'
)
optdepends=(
    'php-mysql: For MySQL storage'
    'php-pgsql: For postgres storage'
    'php-sqlite: For sqlite storage'
)
install="$pkgname.install"
options=(!strip)
source=("${pkgname}.tar.xz::http://wllbg.org/latest-v2-package")
sha256sums=('6c69e2fd1dbebbd4311e4d385928dcad60cb80b16247d1e18181eb66a91e8bd7')
backup=("etc/webapps/${pkgname}/parameters.yml"
        "usr/share/webapps/${pkgname}/parameters.yml")

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/release-${pkgver}" usr/share/webapps/${pkgname}

    WALLABAG_CONF_DIR="${pkgdir}/usr/share/webapps/${pkgname}/app/config"

    install -d "${pkgdir}/etc/webapps/${pkgname}/"
    mv "${WALLABAG_CONF_DIR}"/parameters.yml ${pkgdir}/etc/webapps/${pkgname}/
    chown -R http:http ${pkgdir}/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname}/parameters.yml "${WALLABAG_CONF_DIR}"/

    chown -R http:http "${pkgdir}/usr/share/webapps/wallabag"
}
