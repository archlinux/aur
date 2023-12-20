# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.45.9
pkgrel=1
pkgdesc='change monitoring of web pages'
arch=('any')
url='https://github.com/dgtlmoon/changedetection.io'
license=('Apache 2.0')
makedepends=('python-setuptools')
depends=(# ordered per https://github.com/dgtlmoon/changedetection.io/blob/master/requirements.txt
         'python-flask-compress'
         'python-eventlet'
         'python-validators'
         'python-timeago'
         'python-inscriptis'
         'python-feedgen'
         'python-flask-compress'
         'python-flask-login'
         'python-flask-paginate'
         'python-flask-expects-json'
         'python-flask-restful'
         'python-flask-wtf'
         'python-flask'
         'python-pytz'
         'python-requests'
         'python-urllib3'
         'python-chardet'
         'python-wtforms'
         'python-jsonpath-ng'
         'python-jq'
         'apprise'
         'python-paho-mqtt'
         'python-cryptography'
         'python-bs4'
         'python-lxml'
         'python-elementpath'
         'python-selenium'
         'python-werkzeug'
         'python-jinja-time'
         'python-types-python-dateutil' # required by jinja-time
         'python-openpyxl'
         'python-pillow'
         'python-pytest-flask'
         'python-pysocks')
source=("https://github.com/dgtlmoon/changedetection.io/archive/refs/tags/$pkgver.tar.gz"
        'sysusers'
        'tmpfiles'
        'service')
sha512sums=('7dba39607ce699fc7f046242121bcf4dd1f4317ff291443d42efcfe4bd276574ecf0a189568c560ab4a1fd4af4cd2cf1ed141f94f2e3bcfb8cf91a3a59543270'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '62a684e35c3b479b8ab139b2d79f83f408bede0d4e0f1e500ee75f13126456fa5b574d8cb826c8c56ff0da488dec4ed3562854d0f05d44814beaa3b726bcd318'
            'd640ada5e7a0a82d551221a51c307abd37104361efe0ae4b805c58bd9092b21d8eb55e87e55cff8fb13bbb397ad98231edf1f6db99cfdb318de5e82cb0ed77bc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # pinned to old versions
  sed -Ei '/jsonschema|cryptography|selenium/s/[~=]=.*//' requirements.txt
  # waiting on updates
  sed -Ei '/werkzeug|flask_wtf|flask-login/s/[~=>]=.*//' requirements.txt
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
}
