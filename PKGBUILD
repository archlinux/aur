pkgname=vtigercrm
_pkgname=vtigerCRM
pkgver=6.0.0
pkgrel=2
pkgdesc="A free, full-featured, 100% Open Source CRM software ideal for small and medium businesses"
arch=("any")
url="https://www.vtiger.com/open-source/"
license=("custom")
depends=("mariadb>=5.5"
         "php>=5.4"
         "php-gd"
         "gd"
         "perl"
         "perl-archive-zip"
         "libpng"
         "libjpeg"
         "freetype2"
         "zlib")
backup=("etc/webapps/${pkgname}/config.php"
        "etc/webapps/${pkgname}/config.db.php"
        "etc/webapps/${pkgname}/config.inc.php"
        "etc/webapps/${pkgname}/config.template.php"
        "etc/webapps/${pkgname}/config.performance.php"
        "etc/webapps/${pkgname}/connection.php")
options=("!strip"
         "emptydirs")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}${pkgver}.tar.gz")

package() {
  install -dm 0755                                     "${pkgdir}/etc/webapps/${pkgname}"
  install -dm 0755                                     "${pkgdir}/usr/share/webapps/${pkgname}"
  install -Dm 0644 "${srcdir}/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp      -r        ${srcdir}/${_pkgname}/*             ${pkgdir}/usr/share/webapps/${pkgname}

  for _CFGFILE in {config,config.db,config.inc,config.template,config.performance,connection}.php
  do
    mv    "${pkgdir}/usr/share/webapps/${pkgname}/${_CFGFILE}" "${pkgdir}/etc/webapps/${pkgname}/${_CFGFILE}"
    ln -s "/etc/webapps/${pkgname}/${_CFGFILE}"                "${pkgdir}/usr/share/webapps/${pkgname}/${_CFGFILE}"
  done

  chown -R 33:33 "${pkgdir}/etc/webapps/${pkgname}"
  chown -R 33:33 "${pkgdir}/usr/share/webapps/${pkgname}"
}

md5sums=('6eece5f8685c1f657cf051825374983c')
sha1sums=('efd6c977e5452ca4623931fdc66c1a208f3d62db')
