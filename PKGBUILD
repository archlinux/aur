
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=mylar3
pkgver=0.6.9
pkgrel=1
pkgdesc="Comic book download automation for usenet and torrents."
arch=('any')
url="https://github.com/mylar3/mylar3"
license=('GPL3')
depends=(
  'python'
  'python-apscheduler'
  'python-beautifulsoup4'
  'python-cfscrape'
  'python-cheroot'
  'python-cherrypy'
  'python-configparser'
  'python-feedparser'
  'python-mako'
  'python-natsort'
  'python-pillow'
  'python-portend'
  'python-pytz'
  'python-rarfile'
  'python-requests'
  'python-simplejson'
  'python-six'
  'python-tzlocal'
  'python-urllib3'
)
options=(!strip)
source=("mylar3-${pkgver}.tar.gz::https://github.com/mylar3/mylar3/archive/v${pkgver}.tar.gz"
        'mylar3.service'
        'mylar3.tmpfiles'
        'mylar3.sysusers')

sha256sums=('5df0cc33526dbdfc1f2ff776db3a0fd45f383f80bcfba1440b420fbe76f0514a'
            'bfe7c28f5c773b77e6bc0014bd4473de2f4650d049cfedb177aedef74187c932'
            'e39441d41acd5d66b63631872e06f8e5425bf0725044e5c3843626d4a090eba5'
            'e26cad50c8c8501fa12e2e2b2443f57aaf309e28f28d6dd4944958f9cb20f3cd')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/mylar3"
  cp -dpr --no-preserve=ownership "${srcdir}/mylar3-${pkgver}"/* "${pkgdir}/usr/lib/mylar3"

  install -D -m 644 "${srcdir}/mylar3.service" "${pkgdir}/usr/lib/systemd/system/mylar3.service"
  install -D -m 644 "${srcdir}/mylar3.sysusers" "${pkgdir}/usr/lib/sysusers.d/mylar3.conf"
  install -D -m 644 "${srcdir}/mylar3.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mylar3.conf"
}
