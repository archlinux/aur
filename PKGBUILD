# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_pkgname=('filepreviewer')
pkgname=("zarafa-webapp-${_pkgname}")
replaces=("zarafa-webapp-pdfbox")
groups=('zarafa'
	'kopano'
	'zarafa-webapp-plugins')
pkgver=1.0.30.59
pkgrel=71
pkgdesc='Filepreviewer plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-filepreviewer-1.0.30-59.1.noarch.rpm"
	"compress-static")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp>=2.1.2-2')
md5sums=('373bbc351c5a00cc1349ced727fbc25a'
         'd737d82dfab24adc516c001238a4119f')

package() {
    # plugin
    cd ${srcdir}/usr/share/zarafa-webapp/plugins/${_pkgname}
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    cp -R * ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    rm -f ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/

    # config
    cd ${srcdir}/etc/zarafa/webapp
    mkdir -p ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/

    ## config mains
    cp config-${_pkgname}.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
    ln -s /etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## perform settings
    # sed -i -e "s/\(PLUGIN_MDM_USER_DEFAULT_ENABLE_MDM', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php
}
