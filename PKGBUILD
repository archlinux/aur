# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Petit Pierre <petit.pierre@outlook.com>
# Contributor: Bidossessi Sodonon

pkgname="odoo"
pkgver=17.0
pkgrel=3
pkgdesc="Web-based Open Source Business Apps"
url="https://www.odoo.com/"
arch=("any")
license=("GPL3")
conflicts=("openerp")
replaces=("openerp")
depends=("postgresql"
        "wkhtmltopdf"
        "python"
        "python-babel"
        "python-chardet"
        "python-cryptography"
        "python-dateutil"
        "python-decorator"
        "python-docutils"
        "python-ebaysdk"
        "python-freezegun"
        "python-geoip2" # 17
        "python-gevent"
        "python-greenlet"
        "python-html2text"
        "python-idna"
        "python-jinja"
        "python-libsass"
        "python-lxml"
        "python-mako"
        "python-markupsafe"
        "python-mock"
        "python-num2words"
        "python-ofxparse"
        "python-passlib"
        "python-pillow"
        "python-polib"
        "python-psutil"
        "python-psycopg2"
        "python-pydot"
        "python-pyopenssl"
        "python-pypdf2"
        "python-pyserial"
        "python-pytz"
        "python-pyusb"
        "python-qrcode"
        "python-reportlab"
        "python-requests"
        "python-rjsmin" # 17
        "python-stdnum"
        "python-urllib3"
        "python-vobject"
        "python-werkzeug"
        "python-xlrd"
        "python-xlsxwriter"
        "python-xlwt"
        "python-zeep"
        )
optdepends=("python-ldap: LDAP connector" # 16
           )
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://nightly.odoo.com/$pkgver/nightly/src/${pkgname}_$pkgver.latest.tar.gz"
        "odoo.conf"
        "odoo.logrotate"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
b2sums=('bdee637223012c1b0a1f5ff948893945a00393447db9a2d20c9ac24230f55d5cdac376d5b852912b8eca00e3177c404fa1335edfc159a920d79a8f1df6e73994'
        'f9b3f553e72864565b8323460fbda64745e07838c30ad6cfe57c28100f3b53805d23162262b37984227a18b48283f1e4d4c090b71034331ddcd8588480bd7d06'
        '1ef682d87ba12dd8a185ba36701b737f8feb0c1e6eb4b23302a0dc5930ef63c990af65bc45a36313f879a29a23cbdb602e7fc34ba9cee2e46d9a3d8407d5751a'
        'a14636791b4f0ae76da8a69e95a6926287f5cfa215499be9a6880b6b63fa2081ecdd32ea0dc10fe4d7fe2d14968ac4ed08701c972bc2170e9f4dc36efa406c02'
        '311757f40c9de2845482ebf22e36469cc1058396bba9edaa2265a2bd085e2bcdd22115b098af3aaa037f7dac3a81212ae8b249df0b268f6bf2d798ee01698aae'
        'f899025f7637aaed2d231de33e5c2d2a831f21f038cb86b9794f9f75224f6eb14b6c9baf95663278ae15568a80ac49354446202232f38577991a24d332373b53')
backup=("etc/odoo/odoo.conf")
install="odoo.install"
options=("!strip")

build(){
 cd "$pkgname-$pkgver.post"*
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver.post"*
 python -m installer --destdir="$pkgdir" dist/*.whl
 # configuration file
 install -d -m 750 "$pkgdir/etc/odoo"
 install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/odoo/odoo.conf"
 # logrotate file
 install -D -m 644 "$srcdir/odoo.logrotate" "$pkgdir/etc/logrotate.d/odoo"
 # systemd files
 install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo.service"
 install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo.conf"
 install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo.conf"
}
