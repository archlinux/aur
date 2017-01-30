pkgname=tribler
pkgver=7.0.0a3
_pkgver=7.0.0-alpha3
pkgrel=1
pkgdesc="Privacy with BitTorrent and resilient to shut down"
url="http://www.tribler.org/"
arch=(any)
license=('LGPL')
depends=('python2-cryptography' 'python2-feedparser' 'python2-apsw' 'python2-cherrypy' 'python2-plyvel' 'python2-pillow' 'python2-pyqt5' 'qt5-svg' 'phonon-qt5-vlc' 'python2-feedparser' 'python2-chardet'
'python2-decorator' 'python2-netifaces' 'python2-requests' 'python2-twisted' 'libsodium' 'libtorrent-rasterbar' 'python2-m2crypto' 'python2-configobj')
optdepends=('vlc: for internal video player')
makedepends=('python2-setuptools')
source=("https://github.com/Tribler/tribler/releases/download/v${_pkgver}/Tribler-v${_pkgver}.tar.xz")
sha1sums=('31e27807883b8361a13667396dd4b011d0f35b38')

build () {
  cd "${srcdir}/tribler"
  python2 setup.py build
}

package() {
  cd "${srcdir}/tribler"
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -d "${pkgdir}"/usr/{bin,share/tribler}
  cp -r Tribler "${pkgdir}"/usr/share/tribler
  cp -r TriblerGUI "${pkgdir}"/usr/share/tribler
  cp Tribler/schema_sdb_v*.sql "${pkgdir}"/usr/share/tribler/Tribler
  install -d "${pkgdir}"/usr/share/{applications,pixmaps}
  install -m644 Tribler/Main/Build/Ubuntu/tribler.desktop "${pkgdir}"/usr/share/applications
  install -m644 Tribler/Main/Build/Ubuntu/tribler.xpm "${pkgdir}"/usr/share/pixmaps
  install -m644 Tribler/Main/Build/Ubuntu/tribler_big.xpm "${pkgdir}"/usr/share/pixmaps
  install -m755 debian/bin/tribler "${pkgdir}"/usr/bin
  install -m644 logger.conf "${pkgdir}"/usr/share/tribler/
  install -m644 run_tribler.py "${pkgdir}"/usr/share/tribler/
  cp -r twisted "${pkgdir}"/usr/share/tribler
}

