# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sabnzbd
pkgver=4.2.3
pkgrel=1
pkgdesc='A web-interface based binary newsgrabber with NZB file support'
url='http://www.sabnzbd.org'
arch=('any')
license=('GPL')
depends=(
  'curl'
  'par2cmdline'
  'python'
  'python-babelfish'
  'python-cffi'
  'python-chardet'
  'python-cheetah3'
  'python-cheroot'
  'python-cherrypy'
  'python-configobj'
  'python-cryptography'
  'python-dateutil'
  'python-feedparser'
  'python-guessit'
  'python-jaraco.classes'
  'python-jaraco.collections'
  'python-jaraco.context'
  'python-jaraco.functools'
  'python-jaraco.text'
  'python-more-itertools'
  'python-notify2'
  'python-portend'
  'python-portend'
  'python-puremagic'
  'python-pycparser'
  'python-pysocks'
  'python-pytz'
  'python-rebulk'
  'python-sabyenc3'
  'python-sabctools'
  'python-sgmllib3k'
  'python-six'
  'python-tempora'
  'python-zc.lockfile'
  'sqlite'
  'unrar'
  'unzip'
)

optdepends=(
  'p7zip: for .7z support'
  'dbus-python: for system power management'
  'python-orjson: ~2x faster than ujson, requires rust'
)

backup=('var/lib/sabnzbd/sabnzbd.ini')

install='sabnzbd.install'

source=(
  "https://github.com/sabnzbd/sabnzbd/releases/download/${pkgver}/SABnzbd-${pkgver}-src.tar.gz"
  'sabnzbd.service'
  'sabnzbd@.service'
  'sabnzbd.sysusers'
  'sabnzbd.tmpfiles'
)
        
sha256sums=('f16314cf4032dcaccfd0b4af4d0e67a55c37f31870af3ca90f80d5f547ed8c25'
            '4271446ec586c41c94d61fb0eb2b8854a40246a5af24b36ff80f5438becd6fc3'
            'fcc4e5a9ff4bc28cf4dd9fdb28f1ebd440669e630d8677a1afbef97349ac7466'
            '525f294372963fde09db08b0368c80078a16d4cefcb34f8179706336709afdf7'
            '3a3c292020cca0251478c70a6499afa64aeca3dfcb6d5e32f6e21d5d4d94fa81')

package() {
  mkdir -p "${pkgdir}/usr/lib/sabnzbd"
  cp -r "${srcdir}/SABnzbd-${pkgver}/"* "${pkgdir}/usr/lib/sabnzbd"

  find "${pkgdir}/usr/lib/sabnzbd" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/sabnzbd" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/sabnzbd/SABnzbd.py"

  install -D -m 644 "${srcdir}/sabnzbd.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd.service"
  install -D -m 644 "${srcdir}/sabnzbd@.service" "${pkgdir}/usr/lib/systemd/system/sabnzbd@.service"
  install -D -m 644 "${srcdir}/sabnzbd.sysusers" "${pkgdir}/usr/lib/sysusers.d/sabnzbd.conf"
  install -D -m 644 "${srcdir}/sabnzbd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/sabnzbd.conf"
}
