# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Bidossessi Sodonon

pkgname=odoo
pkgver=11.0
_pkgsubver=20180404
pkgrel=1
pkgdesc="Web-based Open Source Business Apps"
url=https://www.odoo.com/
arch=('any')
license=(GPL3)
conflicts=('openerp')
replaces=('openerp')
depends=(
  nodejs-less-plugin-clean-css
  postgresql-libs
  wkhtmltopdf
  python
  python-babel
  python-decorator
  python-docutils
  python-ebaysdk
  python-feedparser
  python-gevent
  python-greenlet
  python-html2text
  python-jinja
  python-lxml
  python-mako
  python-markupsafe
  python-mock
  python-num2words
  python-ofxparse
  python-passlib
  python-pillow
  python-psutil
  python-psycogreen
  python-psycopg2
  python-pydot
  python-ldap
  python-pyparsing
  python-pypdf2
  python-pyserial
  python-dateutil
  python-openid
  python-pytz
  python-pyusb
  python-yaml
  python-qrcode
  python-reportlab
  python-requests
  python-six
  python-suds
  python-vatnumber
  python-vobject
  python-werkzeug
  python-xlsxwriter
  python-xlwt
  python-xlrd
)

source=("https://nightly.odoo.com/${pkgver}/nightly/src/${pkgname}_${pkgver}.${_pkgsubver}.tar.gz"
        odoo.confd
        odoo.service
        odoo.conf)
md5sums=('e4c74c4b3a4f0fa8695d70a96de65344'
         '742fa9ad94a92ac2aa910197a26af4e8'
         '5bddcc6edbdefdd07cae945165c63604'
         '863418f31f0fb982cde0008fa63f35f0')

backup=('etc/odoo/odoo.conf')
install=odoo.install

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}.post${_pkgsubver}
  python setup.py install --root="${pkgdir}"
  mkdir ${pkgdir}/etc/{conf.d,odoo} -p
  mkdir ${pkgdir}/usr/lib/systemd/system/ -p
  install -Dm 644 ${srcdir}/odoo.confd ${pkgdir}/etc/conf.d/odoo
  install -Dm 644 ${srcdir}/odoo.service ${pkgdir}/usr/lib/systemd/system/odoo.service
  install -Dm 644 ${srcdir}/odoo.conf ${pkgdir}/etc/odoo/odoo.conf
}
