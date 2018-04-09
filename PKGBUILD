# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Bidossessi Sodonon

pkgname=odoo10
_pkgname=odoo
pkgver=10.0
_pkgsubver=20180409
pkgrel=11
pkgdesc="Web-based Open Source Business Apps"
url=http://odoo.com/
arch=('any')
license=(GPL3)
provides=("${pkgname}")
conflicts=('openerp' 'odoo')
replaces=('openerp')
depends=(
    'gzip'
    'nodejs-less-plugin-clean-css'
    'postgresql'
    'python2'
    'python2-argparse'
    'python2-babel'
    'python2-dateutil'
    'python2-docutils'
    'python2-decorator'
    'python2-feedparser'
    'python2-gdata'
    'python2-gevent'
    'python2-greenlet'
    'python2-jcconv'
    'python2-jinja'
    'python2-ldap'
    'python2-lxml'
    'python2-mako'
    'python2-markupsafe'
    'python2-mock'
    'python2-openid'
    'python2-passlib'
    'python2-paramiko'
    'python2-pillow'
    'python2-psutil'
    'python2-psycopg2'
    'python2-psycogreen'
    'python2-pychart'
    'python2-pydot'
    'python2-pyparsing'
    'python2-pyqrcode'
    'python2-pyserial'
    'python2-pyusb'
    'python2-reportlab'
    'python2-pypdf'
    'python2-pytz'
    'python2-requests'
    'python2-six'
    'python2-suds-jurko'
    'python2-unittest2'
    'python2-vatnumber'
    'python2-vobject'
    'python2-werkzeug'
    'python2-wsgiref'
    'python2-xlwt'
    'python2-xlsxwriter'
    'python2-xlrd'
    'python2-yaml'
    'python2-zsi'
    'wkhtmltopdf-static'
)
optdepends=(
    'python2-ofxparse'
    'python2-qrcode'
)

source=(
  "http://nightly.odoo.com/10.0/nightly/src/${_pkgname}_${pkgver}.${_pkgsubver}.tar.gz"
  odoo.confd
  odoo.service
  odoo.conf
)
backup=('etc/odoo/odoo.conf')
install=odoo.install

package()
{
  cd ${srcdir}/${_pkgname}-${pkgver}.post${_pkgsubver}
  # Force package data inclusion
  sed -i -e s/#include_package_data/include_package_data/ setup.py
  python2 setup.py install --root="${pkgdir}"
  mkdir ${pkgdir}/etc/{conf.d,odoo} -p
  mkdir ${pkgdir}/usr/lib/systemd/system/ -p
  install -Dm 644 ${srcdir}/odoo.confd ${pkgdir}/etc/conf.d/odoo
  install -Dm 644 ${srcdir}/odoo.service ${pkgdir}/usr/lib/systemd/system/odoo.service
  install -Dm 644 ${srcdir}/odoo.conf ${pkgdir}/etc/odoo/odoo.conf
}
md5sums=('845250f1b2df2009ac44bb5d23249e09'
         '742fa9ad94a92ac2aa910197a26af4e8'
         '5bddcc6edbdefdd07cae945165c63604'
         '863418f31f0fb982cde0008fa63f35f0')
