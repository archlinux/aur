# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=alltube
pkgver=3.1.0
pkgrel=2
pkgdesc="PHP youtube-dl frontend"
arch=("any")
url="https://github.com/Rudloff/alltube/"
license=('GPL')
depends=('php' 'php-intl' 'youtube-dl' 'ffmpeg')
makedepends=()
backup=("etc/webapps/${pkgname}/config/")
source=("https://github.com/Rudloff/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('0a601b8c76c70a5eb6a33eafd0b59422')


package() {
    install -d -o http -g http "${pkgdir}/usr/share/webapps/${pkgname}"
    install -d -o http -g http "${pkgdir}/etc/webapps/${pkgname}/config/"

    cd "${srcdir}"
    cp -a "${pkgname}" "${pkgdir}/usr/share/webapps/"
    chown -R http:http "${pkgdir}/usr/share/webapps/${pkgname}"
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type d -exec chmod 744 "{}" \;
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type f -exec chmod 644 "{}" \;

    echo "Installing example config file"
    install -m 644 -o http -g http "${srcdir}/${pkgname}/config/config.example.yml" "${pkgdir}/etc/webapps/${pkgname}/config/config.yml"

    cd "${pkgdir}/usr/share/webapps/${pkgname}"
    rm -R "config"
    ln -s "/etc/webapps/${pkgname}/config" "config"
}
