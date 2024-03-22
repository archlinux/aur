# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=alltube
pkgver=3.2.0_alpha
pkgrel=1
pkgdesc="PHP youtube-dl frontend"
arch=("any")
url="https://github.com/Rudloff/alltube/"
license=('GPL-3.0-or-later')
depends=('php' 'php-intl' 'yt-dlp' 'ffmpeg')
makedepends=()
backup=("etc/webapps/${pkgname}/config/config.yml")
source=("https://github.com/Rudloff/${pkgname}/releases/download/${pkgver//_/-}/${pkgname}-${pkgver//_/-}.zip"
        "${pkgname}.install")
md5sums=('27c11e25f7e5cc2e0737251a583916ae'
         '5610ceb1d74f728c3f2f4e7281dae546')


package() {
    install -d "${pkgdir}/usr/share/webapps/${pkgname}"
    install -d "${pkgdir}/etc/webapps/${pkgname}/config/"

    cd "${srcdir}"
    cp -a "${pkgname}" "${pkgdir}/usr/share/webapps/"
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type f -exec chmod 644 "{}" \;

    echo "Installing example config file"
    install -m 644 "${srcdir}/${pkgname}/config/config.example.yml" "${pkgdir}/etc/webapps/${pkgname}/config/config.yml"

    cd "${pkgdir}/usr/share/webapps/${pkgname}"
    rm -R "config"
    ln -s "/etc/webapps/${pkgname}/config" "config"
}
