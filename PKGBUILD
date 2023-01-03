# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=tautulli
pkgver=2.11.1
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/Tautulli/Tautulli"
license=('GPL')
makedepends=(
  'curl'
  'python-setuptools'
)
depends=(
  'python-appdirs'
  'python-apscheduler'
  'python-arrow'
  'python-backports.csv'
  #'python-backports.functools-lru-cache'
  #'python-backports.zoneinfo'
  'python-beautifulsoup4'
  'python-bleach'
  'python-certifi'
  'python-cheroot'
  'python-cherrypy'
  #'python-cloudinary'
  'python-distro'
  'python-dnspython'
  #'python-facebook-sdk'
  'python-future'
  #'python-gntp'
  'python-html5lib'
  'python-httpagentparser'
  'python-idna'
  'python-importlib-metadata'
  'python-importlib-resources'
  'python-ipwhois'
  'python-ipy'
  'python-mako'
  'python-markupsafe'
  'python-musicbrainzngs'
  'python-packaging'
  'python-paho-mqtt'
  'python-plexapi'
  'python-portend'
  #'python-profilehooks'
  'python-pyjwt'
  'python-pyparsing'
  'python-dateutil'
  'python-twitter'
  'python-pytz'
  'python-requests'
  'python-requests-oauthlibs'
  'python-simplejson'
  'python-six'
  'python-soupsieve'
  'python-tempora'
  'python-tokenize-rt'
  'python-tzdata'
  'python-tzlocal'
  'python-urllib3'
  'python-webencodings'
  'python-websocket-client'
  'python-xmltodict'
  'python-zipp'
)
optdepends=(
  'python-pyopenssl: creating self signed certificates'
  'python-pycryptodomex: encrypting notifications to iOS/Android Tautulli Remote app'
)
install='tautulli.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tautulli/Tautulli/archive/v$pkgver.tar.gz"
        'tautulli.tmpfiles'
        'tautulli.service'
        'tautulli.sysusers')

sha256sums=('30969bd2a85d446b510e379595d34dc7b38bf7bafe8920fa38e872891240f505'
            'a054b8abfabb44d35a97642050286751f77d22e22f3d00077960b370051aa4f4'
            '8363c0de54806e43e59cfde564ff57a49883895cfc0e725282889658a224624a'
            'e6bb046d1022f0d2623f42c092f993c395a938a1f2a16c2986e76506bbfb54f8')

package() {
  cd "${srcdir}/Tautulli-${pkgver}"

  # To get rid of the unknown version
  echo "v$pkgver" > version.txt
  install -D -m 644 version.txt "${pkgdir}/usr/lib/tautulli/version.txt"

  install -D -m 755 PlexPy.py "${pkgdir}/usr/lib/tautulli/PlexPy.py"
  install -D -m 755 Tautulli.py "${pkgdir}/usr/lib/tautulli/Tautulli.py"
  install -D -m 644 pylintrc  "${pkgdir}/usr/lib/tautulli/"
  install -D -m 644 CHANGELOG.md "${pkgdir}/usr/lib/tautulli/"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/tautulli/LICENSE"

  cp -a data/ lib/ plexpy/ "${pkgdir}/usr/lib/tautulli/"

  install -D -m 644 "${srcdir}/tautulli.service" "${pkgdir}/usr/lib/systemd/system/tautulli.service"
  install -D -m 644 "${srcdir}/tautulli.sysusers" "${pkgdir}/usr/lib/sysusers.d/tautulli.conf"
  install -D -m 644 "${srcdir}/tautulli.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/tautulli.conf"
}
