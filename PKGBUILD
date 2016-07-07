# Maintainer: Bidossessi Sodonon
# Contributors: Dan Serban, Mark Doe, L42y

pkgname=openerp
pkgver=7.0
_pkgsubver=20160707
pkgrel=12
pkgdesc="Advanced OpenSource ERP and CRM server"
url=http://openerp.com/
arch=('any')
license=(GPLv3)
replaces=('openerp-server' 'openerp-web')
depends=(
    'gzip'
    'postgresql'
    'python2'
    'python2-babel'
    'python2-dateutil'
    'python2-docutils'
    'python2-egenix-mx-base'
    'python2-gdata'
    'python2-feedparser'
    'python2-jinja'
    'python2-ldap'
    'python2-lxml'
    'python2-mako'
    'python2-mock'
    'python2-numpy'
    'python2-openid'
    'python2-psutil'
    'python2-psycopg2'
    'python2-pychart'
    'python2-pydot'
    'python2-pyparsing'
    'python2-reportlab'
    'python2-pillow'
    'python2-pytz'
    'python2-pywebdav'
    'python2-simplejson'
    'python2-unittest2'
    'python2-vatnumber'
    'python2-vobject'
    'python2-werkzeug'
    'python2-xlwt'
    'python2-yaml'
    'python2-zsi'
)
optdepends=(
    'wkhtmltopdf: Webkit reports'
)
source=(
"http://nightly.odoo.com/7.0/nightly/src/${pkgname}_${pkgver}.${_pkgsubver}.tar.gz"
openerp.confd
openerp-server.conf
openerp.service
)
backup=('etc/openerp/openerp-server.conf')
install=openerp.install

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}-${_pkgsubver}
  # Force package data inclusion
  #sed -i -e s/#include_package_data/include_package_data/ setup.py
  python2 setup.py install --root="${pkgdir}"
  mkdir ${pkgdir}/etc/{conf.d,openerp} -p
  mkdir ${pkgdir}/usr/share -p
  mkdir ${pkgdir}/usr/lib/systemd/system/ -p
  #mkdir ${pkgdir}/usr/share/man/{man1,man5} -p
  # Remove useless /usr/openerp directory
  rm -rf ${pkgdir}/usr/openerp
  # Add server configs
  install -Dm 644 ${srcdir}/openerp.confd ${pkgdir}/etc/conf.d/openerp
  install -Dm 644 ${srcdir}/openerp.service ${pkgdir}/usr/lib/systemd/system/openerp.service
  install -Dm 644 ${srcdir}/openerp-server.conf ${pkgdir}/etc/openerp/openerp-server.conf
  #No more man pages
  #zip -c openerp-server.1 > openerp-server.1.gz
  #gzip -c openerp_serverrc.5 > openerp_serverrc.5.gz
  #install -Dm 644  openerp-server.1.gz ${pkgdir}/usr/share/man/man1
  #install -Dm 644  openerp_serverrc.5.gz ${pkgdir}/usr/share/man/man5
}
md5sums=('5e13c0ff9cf8b4dd03eb9aa57d1628ff'
         'effb44e444602a0e59f8fe5b4ebc47b4'
         'a6b183fa1bb5c8e4224b81d6480cecbc'
         '3fd6f291a4ca289e3d1354e4e09a1d70')
