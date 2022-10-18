# Maintainer: Tristan Hill

pkgname=changedetection.io
pkgver=0.39.20.4
pkgrel=1
pkgdesc='change monitoring of web pages'
arch=('any')
url='https://github.com/dgtlmoon/changedetection.io'
license=('Apache 2.0')
makedepends=('python-setuptools')
depends=(# ordered per https://github.com/dgtlmoon/changedetection.io/blob/master/requirements.txt
         'python-flask'
         'python-flask-wtf'
         'python-flask-restful'
         'python-eventlet'
         'python-validators'
         'python-timeago'
         'python-inscriptis'
         'python-feedgen'
         'python-flask-login'
         'python-pytz'
         'python-requests'
         'python-urllib3'
         'python-chardet'
         'python-wtforms'
         'python-jsonpath-ng'
         'python-jq'
         'python-apprise'
         'python-cryptography'
         'python-beautifulsoup4'
         'python-selenium'
         'python-werkzeug')
source=("https://github.com/dgtlmoon/changedetection.io/archive/refs/tags/$pkgver.tar.gz"
        'sysusers'
        'tmpfiles'
        'service')
sha512sums=('e7d66c0ae30ca99c8b48074bc09af9854908a20fafa06c7f761862773495c2202350560af0258a51b2f8d2d35ec12f2340ccc93bddbd17c9d385a4ebc3584f2d'
            '5ef8b215bddc02b04d55d3699f27ad043461d8771591be2ebf0ed6390c58ab881426214173c8e1cc8bb36ecd7acebc5d69d760fc65b8a3b191b2116150748f53'
            '62a684e35c3b479b8ab139b2d79f83f408bede0d4e0f1e500ee75f13126456fa5b574d8cb826c8c56ff0da488dec4ed3562854d0f05d44814beaa3b726bcd318'
            '5dba78fafd77fe41b69d73849529ed4f086879cd3a6e4ada126a320d249bb730bcf6a0b49e5b987699a2420e7083c7c6d1a0b921c49c932ec33f30bda083b506')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/\(asset.app_desc = \).*/\1asset.app_id/' changedetectionio/apprise_asset.py
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/changedetection.io.conf"
  install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/changedetection.io.service"
}
