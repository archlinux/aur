# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=alltube
pkgver=3.1.1
pkgrel=1
pkgdesc="PHP youtube-dl frontend"
arch=("any")
url="https://github.com/Rudloff/alltube/"
license=('GPL')
depends=('php' 'php-intl' 'youtube-dl' 'ffmpeg')
makedepends=()
backup=("etc/webapps/${pkgname}/config/config.yml")
source=("https://github.com/Rudloff/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
        "${pkgname}.install")
md5sums=('8678dc570e33920051a75013aac68995'
         '5610ceb1d74f728c3f2f4e7281dae546')


package() {
    install -d "${pkgdir}/usr/share/webapps/${pkgname}"
    install -d "${pkgdir}/etc/webapps/${pkgname}/config/"

    cd "${srcdir}"
    cp -a "${pkgname}" "${pkgdir}/usr/share/webapps/"
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type d -exec chmod 744 "{}" \;
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type f -exec chmod 644 "{}" \;

    echo "Installing example config file"
    install -m 644 -o http -g http "${srcdir}/${pkgname}/config/config.example.yml" "${pkgdir}/etc/webapps/${pkgname}/config/config.yml"

    cd "${pkgdir}/usr/share/webapps/${pkgname}"
    rm -R "config"
    ln -s "/etc/webapps/${pkgname}/config" "config"
}
