# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=spip
pkgver=3.0.16
pkgrel=1
pkgdesc="A publishing system for the Internet in which great importance is attached to collaborative working, to multilingual environments, and to simplicity of use for web authors."
arch=('x86' 'x86_64')
url="http://www.spip.net/"
license=("GPL")
depends=("php")
source=("http://files.spip.org/spip/archives/SPIP-v${pkgver}.zip"
        "httpd-spip.conf"
        "mes_options.php")
options=(!strip)
sha256sums=('42e9cdb6a6d2a38ff2ad22606a264d88545e2c23969bca8d2f8ef72ed450aab1'
            '0dfd06634f748eba922f24a99f42253663fa2c3939f727e073a052dc51e49764'
            '1b1ac9dcd33e5c6605ed8319dfca5111bea8a53e9822db3219b60b870c13d5f8')

package() {
    install -d ${pkgdir}/usr/share/webapps/
    cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/

    rm -rf ${pkgdir}/usr/share/webapps/${pkgname}/{IMG,local,tmp,config/remove.txt}

    install -d  ${pkgdir}/etc/webapps/${pkgname}
    mv ${pkgdir}/usr/share/webapps/${pkgname}/config/ ${pkgdir}/etc/webapps/${pkgname}/base/
    ln -s /etc/webapps/${pkgname}/base ${pkgdir}/usr/share/webapps/${pkgname}/config


    install -m 644 ${srcdir}/mes_options.php ${pkgdir}/etc/webapps/${pkgname}/base
    install -m 644 ${srcdir}/httpd-spip.conf ${pkgdir}/etc/webapps/${pkgname}/

    install -d ${pkgdir}/var/lib/${pkgname}
    ln -s /var/lib/${pkgname} ${pkgdir}/usr/share/webapps/${pkgname}/sites
    chown -R http:http ${pkgdir}/etc/webapps/${pkgname}/ ${pkgdir}/var/lib/${pkgname}

}
