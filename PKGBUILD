# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=coherence-svn
pkgver=r1676
pkgrel=1
pkgdesc="Coherence acts as a DLNA/UPnP MediaServer and MediaRenderer."
arch=('i686' 'x86_64')
url="https://coherence.beebits.net/"
license=('MIT')
source=("$pkgname"::'svn+https://coherence.beebits.net/svn/trunk/Coherence'
        'coherence.conf'
        'samsung.patch')
md5sums=('SKIP'
         '9a2fd979a83a4f4ceb6fd3564cdeda86'
         '039d4b84c0f0d023d9e9519fba1b101e')
depends=('python2' 'epsilon' 'axiom' 'twisted-web2' 'python-elementtree' 'python-configobj' 'pylouie' 'libcaca')
optdepends=('ampache: for the Ampache Backend'
            'axiom: for the MediaStore Backend'
            'elisa: for the Elisa DB Backend and Elisa DLNA Player'
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
provides=('coherence')
conflicts=('coherence')
makedepends=('python2-distribute')
backup=('etc/coherence.conf')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$pkgname"
  patch -Np0 -i "$srcdir/samsung.patch"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm755 "$srcdir/coherence.conf" "$pkgdir/etc/coherence.conf"
}
