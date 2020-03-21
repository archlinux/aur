# Maintainer: Petit Pierre <petit.pierre@outlook.com>
# Contributor: Bidossessi Sodonon

pkgname=odoo
pkgver=13.0
_pkgsubver=20200321
pkgrel=4
pkgdesc="Web-based Open Source Business Apps"
url=https://www.odoo.com/
arch=('any')
license=('GPL3')
conflicts=('openerp')
replaces=('openerp')
makedepends=('python-setuptools')
depends=(
  'wkhtmltopdf-static'
  'python'
  'python-babel'
  'python-chardet'
  'python-decorator'
  'python-docutils'
  'python-ebaysdk'
  'python-feedparser'
  'python-gevent'
  'python-greenlet'
  'python-html2text'
  'python-jinja'
  'sassc'
  'python-lxml'
  'python-mako'
  'python-markupsafe'
  'python-mock'
  'python-num2words'
  'python-ofxparse'
  'python-passlib'
  'python-pillow'
  'python-polib'
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
  'python-qrcode'
  'python-reportlab'
  'python-requests'
  'python-zeep'
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
md5sums=('59de4b28f920bfdcf9a6a9eb0502379f'
         '863418f31f0fb982cde0008fa63f35f0'
         '742fa9ad94a92ac2aa910197a26af4e8'
         '5bddcc6edbdefdd07cae945165c63604'
         '720b7b8c3df3142dfd0383acd1c9e9b4')

backup=('etc/odoo/odoo.conf')
install=odoo.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}.post${_pkgsubver}
  python setup.py build
}

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}.post${_pkgsubver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  mkdir -p ${pkgdir}/etc/{conf.d,odoo}
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -Dm 644 ${srcdir}/odoo.conf ${pkgdir}/etc/odoo/odoo.conf
  install -Dm 644 ${srcdir}/odoo.confd ${pkgdir}/etc/conf.d/odoo
  install -Dm 644 ${srcdir}/odoo.service ${pkgdir}/usr/lib/systemd/system/odoo.service
  install -Dm 644 ${srcdir}/odoo.sysusers ${pkgdir}/usr/lib/sysusers.d/odoo.conf
}
