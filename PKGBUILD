# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: 1213 <lambertacampo at gmail dot com>

_pkgname=exaile
pkgname=${_pkgname}-git
epoch=1
pkgver=4.0.0rc5+0+g449775a8
pkgrel=1
pkgdesc="music player for gnome, similar to KDEs amarok"
arch=('any')
url="http://www.exaile.org"
license=('GPL')
depends=('gtk3' 'python2-mutagen' 'python2-dbus' 'python2-gobject' 
         'python2-cairo' 'udisks2' 'librsvg' 'gst-plugins-good')
makedepends=('git')
optdepends=('python2-feedparser: podcasts plugin'
            'webkit2gtk: wikipedia plugin'
            'python2-lxml: LyricsMania plugin'
            'cddb-py: look up CD tags'
            'libkeybinder3: Multimedia keys plugin'
            'python2-beautifulsoup4: Lyrics Wiki plugin'
            'libnotify: Notify plugin'
            'streamripper: Streamripper plugin'
            'gnome-screensaver: Pause on screensaver plugin'
            'mate-screensaver: Pause on screensaver plugin'
            'cinnamon-screensaver: Pause on screensaver plugin'
            'python2-musicbrainzngs: Musicbrainz cover search plugin'
            'ipython2: Ipython console plugin'
            'python2-pylast: Last.fm loved tracks plugin'
            'gst-plugins-bad: Additional audio codecs'
            'gst-plugins-ugly: Additional audio codecs'
            'spydaap-git: DAAP server/client')

provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/exaile/exaile.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/-beta/.beta/;s/-rc/rc/;s/-/+/g'
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  make clean
}
