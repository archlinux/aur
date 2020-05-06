# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sabnzbd
pkgver=3.0.0
_subver='RC2'
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support'
url='http://www.sabnzbd.org'
arch=('any')
license=('GPL')
depends=(
  'curl'
  'par2cmdline'
  'python'
  'python-six'
  'python-cryptography'
  'python-feedparser'
  'python-configobj'
  'python-cherrypy'
  'python-portend'
  'python-chardet'
  'python-notify2'
  'python-cheetah3'
  'python-sabyenc3'
  'sqlite'
  'unrar'
  'unzip'
)

optdepends=(
  'python-pygobject: tray icon'
  'python-pyopenssl: ssl support'
  'par2cmdline-tbb: par2 multi-threading'
  'p7zip: for .7z support'
)

backup=('var/lib/sabnzbd/sabnzbd.ini')

install='sabnzbd.install'

source=(
  "https://github.com/sabnzbd/sabnzbd/releases/download/${pkgver}${_subver}/SABnzbd-${pkgver}${_subver}-src.tar.gz"
  'sabnzbd.service'
  'sabnzbd@.service'
  'sabnzbd.sysusers'
  'sabnzbd.tmpfiles'
)
        
sha256sums=('283ef96a001bfb1806b208102a73f2198d7c505d92430c96197da23c74d9fc71'
            'c1bcdb5ce7787aab5ab4f07508c1451441f42df0ec7be85a5dedda0a5ee70014'
            '4c4ff2882de744d1b5435470ed829d58defcc84fafc56e6211d1298c0b22813f'
            '525f294372963fde09db08b0368c80078a16d4cefcb34f8179706336709afdf7'
            '3a3c292020cca0251478c70a6499afa64aeca3dfcb6d5e32f6e21d5d4d94fa81')

package() {
  mkdir -p "${pkgdir}/usr/lib/sabnzbd"
  cp -r "${srcdir}/SABnzbd-${pkgver}${_subver}/"* "${pkgdir}/usr/lib/sabnzbd"

  find "${pkgdir}/usr/lib/sabnzbd" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/sabnzbd" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/sabnzbd/SABnzbd.py"

  install -D -m 644 "${srcdir}/sabnzbd.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd.service"
  install -D -m 644 "${srcdir}/sabnzbd@.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd@.service"
  install -D -m 644 "${srcdir}/sabnzbd.sysusers" "${pkgdir}/usr/lib/sysusers.d/sabnzbd.conf"
  install -D -m 644 "${srcdir}/sabnzbd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sabnzbd.conf"
}
