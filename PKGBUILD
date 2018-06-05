# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Bidossessi Sodonon

pkgname=odoo
pkgver=11.0
_pkgsubver=20180601
pkgrel=5
pkgdesc="Web-based Open Source Business Apps"
url=https://www.odoo.com/
arch=('any')
license=('GPL3')
conflicts=('openerp')
replaces=('openerp')
makedepends=('python-setuptools')
depends=(
  'nodejs-less'
  'wkhtmltopdf'
  'python'
  'python-babel'
  'python-decorator'
  'python-docutils'
  'python-ebaysdk'
  'python-feedparser'
  'python-gevent'
  'python-greenlet'
  'python-html2text'
  'python-jinja'
  'python-lxml'
  'python-mako'
  'python-markupsafe'
  'python-mock'
  'python-num2words'
  'python-ofxparse'
  'python-passlib'
  'python-pillow'
  'python-psutil'
  'python-psycopg2'
  'python-pydot'
  'python-ldap'
  'python-pyparsing'
  'python-pypdf2'
  'python-pyserial'
  'python-dateutil'
  'python-pytz'
  'python-pyusb'
  'python-yaml'
  'python-qrcode'
  'python-reportlab'
  'python-requests'
  'python-suds'
  'python-vatnumber'
  'python-vobject'
  'python-werkzeug'
  'python-xlsxwriter'
  'python-xlwt'
  'python-xlrd'
)

source=("https://nightly.odoo.com/${pkgver}/nightly/src/${pkgname}_${pkgver}.${_pkgsubver}.tar.gz"
        odoo.conf
        odoo.confd
        odoo.service
        odoo.sysusers)
md5sums=('16203d271c3b1f38357f0c6129669e3c'
         '863418f31f0fb982cde0008fa63f35f0'
         '742fa9ad94a92ac2aa910197a26af4e8'
         '5bddcc6edbdefdd07cae945165c63604'
         '720b7b8c3df3142dfd0383acd1c9e9b4')

backup=('etc/odoo/odoo.conf')
install=odoo.install

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}.post${_pkgsubver}
  python setup.py install --root="${pkgdir}"
  mkdir -p ${pkgdir}/etc/{conf.d,odoo}
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  mkdir -p ${pkgdir}/var/lib/odoo
  install -Dm 644 ${srcdir}/odoo.conf ${pkgdir}/etc/odoo/odoo.conf
  install -Dm 644 ${srcdir}/odoo.confd ${pkgdir}/etc/conf.d/odoo
  install -Dm 644 ${srcdir}/odoo.service ${pkgdir}/usr/lib/systemd/system/odoo.service
  install -Dm 644 ${srcdir}/odoo.sysusers ${pkgdir}/usr/lib/sysusers.d/odoo.conf
}
