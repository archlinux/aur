# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Contributor: Alex Anthony <alex.anthony28991@googlemail.com>
# Based on coherence-svn by Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=coherence
pkgver=0.6.6.2
pkgrel=4
pkgdesc="A DLNA/UPnP MediaServer and MediaRenderer"
arch=('i686' 'x86_64')
url="http://coherence.beebits.net/"
license=('MIT')
depends=('python2' 'epsilon' 'axiom' 'twisted-web2' 'python-elementtree' 'python2-configobj' 'pylouie' 'libcaca')
optdepends=('ampache: for the Ampache Backend'
            'gstreamer0.10-python: for the gstreamer MediaRenderer'
            'libmtag: for MediaStore Backend ID3 Option A'
            'pyid3lib: for MediaStore Backend ID3 Option B'
            'python-gdata: for the Picasa and YouTube Backends'
            'python-mechanize: for the Flickr Backend'
            'rhythmbox: for the Rhythmbox DB Backend'
            'taglib: for MediaStore Backend ID3 Option A or C'
            'tagpy: for MediaStore Backend ID3 Option C'
            'tracker: for the TrackerStore Backend'
            'dvb-daemon: for the DVB Daemon Backend (no package yet)')
makedepends=('python2-distribute')
conflicts=('coherence-svn')
source=(http://coherence.beebits.net/download/Coherence-${pkgver}.tar.gz
       coherence.conf
       coherence.service
       coherence_pidfile.patch
       samsung.patch
       org.Coherence.service)
backup=('etc/coherence.conf')
md5sums=('d7a1b4abf6831c61e37a3b9e2bdc560a'
         '9a2fd979a83a4f4ceb6fd3564cdeda86'
         'c43416ac2fb8a8195917a7e23b806c7d'
         'b12f5f89fe34e48267c6c6e7cab5a4f4'
         '039d4b84c0f0d023d9e9519fba1b101e'
         'ed11837f08988600e5aac0caf8e5221a')

prepare() {
  cd "Coherence-$pkgver"

  patch -Np0 -i "$srcdir/samsung.patch"
  patch -p1 -i "$srcdir/coherence_pidfile.patch"
}

package() {
  cd "Coherence-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -Dm644 "$srcdir/org.Coherence.service" "$pkgdir/usr/share/dbus-1/services/org.Coherence.service"
  install -Dm644 "$srcdir/Coherence-$pkgver/LICENCE" "$pkgdir/usr/share/licenses/coherence/LICENSE"
}
