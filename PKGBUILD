# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.45.8.1
pkgrel=2
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
sha512sums=('47c99b11549995bb23133cb5b1d6b26de132fea5ee4d1e0bef0a4eac6572f5cdf6e82abbd2c76998862f96b6fb994582267a2d96eaf1973ca75ab7be4f07810e'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '62a684e35c3b479b8ab139b2d79f83f408bede0d4e0f1e500ee75f13126456fa5b574d8cb826c8c56ff0da488dec4ed3562854d0f05d44814beaa3b726bcd318'
            '25a654a3e459fb85b87e55a69cca97f2ba0444873819353da9a8a7989ca11f05fc2e3581cf361510054b53d52d6423156b3ea2a12eb84718889a0e2eb304251c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # pinned to old versions
  sed -Ei '/jsonschema|cryptography/s/[~=]=.*//' requirements.txt
  # waiting on updates
  sed -Ei '/werkzeug|flask_wtf|flask-login/s/[~=>]=.*//' requirements.txt
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
}
