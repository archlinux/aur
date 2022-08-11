# Maintainer : Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
# Contributor : Immae <ismael.bouya@normalesup.org>

pkgname=spip
pkgver=4.0.8
pkgrel=1
pkgdesc="A publishing system for the Internet in which great importance is attached to collaborative working, to multilingual environments, and to simplicity of use for web authors."
arch=('x86' 'x86_64')
url="http://www.spip.net/"
license=("GPL")
depends=("php")
source=("http://files.spip.net/spip/archives/${pkgname}-v${pkgver}.zip"
        "httpd-spip.conf"
        "mes_options.php")
options=(!strip)
sha256sums=('0d9bced64746bc952b2c4cde38999d53f8149584e5be441d5345d0e8b681b343'
            '18c625bf2192ceb7647617593285c9fbfc110197c0179ac8ae4bc70c414b9582'
            '9c2eed4d009faef9128ec60135b4ff03c3c2d09387a7ac7f4887748f0d85ce75')

package() {
    install -d ${pkgdir}/usr/share/webapps/
    mkdir -p  ${pkgdir}/usr/share/webapps/spip
    cp -aL ${srcdir}/* ${pkgdir}/usr/share/webapps/${pkgname}

    rm -rf ${pkgdir}/usr/share/webapps/${pkgname}/{IMG,local,tmp,config/remove.txt}

    install -d  ${pkgdir}/etc/webapps/${pkgname}
    mv ${pkgdir}/usr/share/webapps/${pkgname}/config/ ${pkgdir}/etc/webapps/${pkgname}/base/
    ln -s /etc/webapps/${pkgname}/base ${pkgdir}/usr/share/webapps/${pkgname}/config


    install -m 644 ${pkgdir}/usr/share/webapps/${pkgname}/mes_options.php ${pkgdir}/etc/webapps/${pkgname}/base
    install -m 644 ${pkgdir}/usr/share/webapps/${pkgname}/httpd-spip.conf ${pkgdir}/etc/webapps/${pkgname}/
    rm -f ${pkgdir}/usr/share/webapps/${pkgname}/httpd-spip.conf ${pkgdir}/usr/share/webapps/${pkgname}/mes_options.php

    install -d ${pkgdir}/srv/${pkgname}
    ln -s /srv/${pkgname} ${pkgdir}/usr/share/webapps/${pkgname}/sites
    chown -R http:http ${pkgdir}/etc/webapps/${pkgname}/ ${pkgdir}/srv/${pkgname}

}
