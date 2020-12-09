# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=mylar3
pkgver=0.4.9.2
pkgrel=1
pkgdesc="Comic book download automation for usenet and torrents."
arch=('any')
url="https://gitlab.com/mylar3/mylar3/"
license=('GPL3')
depends=(
  'python'
  'pyinstaller'
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
  'python-requests'
  'python-simplejson'
  'python-six'
  'python-tzlocal'
  'python-unrar'
  'python-unrar-cffi'
  'python-urllib3'
)
options=(!strip)
source=("mylar3-${pkgver}.tar.gz::https://github.com/mylar3/mylar3/archive/v${pkgver}.tar.gz"
        'mylar3.service'
        'mylar3.tmpfiles'
        'mylar3.sysusers')

sha256sums=('7a0896e5fba6539a1f5afdcd8119c3b9d59d93d9560ecc4ac15490a38903be22'
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
