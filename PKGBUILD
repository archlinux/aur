# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: 1213 <lambertacampo at gmail dot com>

_pkgname=exaile
pkgname=${_pkgname}-git
epoch=1
pkgver=4.1.0alpha1+14+gcea417cb
pkgrel=1
pkgdesc="music player for gnome, similar to KDEs amarok"
arch=('any')
url="https://www.exaile.org"
license=('GPL')
depends=('gtk3' 'python-bsddb' 'python-mutagen' 'python-dbus' 'python-gobject' 
         'python-cairo' 'udisks2' 'librsvg' 'gst-plugins-good')
makedepends=('git' 'help2man')
optdepends=('python-feedparser: podcasts plugin'
            'webkit2gtk: wikipedia plugin'
            'python-lxml: LyricsMania plugin'
            'libkeybinder3: Multimedia keys plugin'
            'python-beautifulsoup4: Lyrics Wiki plugin'
            'libnotify: Notify plugin'
            'streamripper: Streamripper plugin'
            'gnome-screensaver: Pause on screensaver plugin'
            'mate-screensaver: Pause on screensaver plugin'
            'cinnamon-screensaver: Pause on screensaver plugin'
            'xfce4-screensaver: Pause on screensaver plugin'
            'moodbar: Moodbar plugin'
            'python-musicbrainzngs: Musicbrainz cover search plugin'
            'ipython: Ipython console plugin'
            'python-pylast: Last.fm loved tracks plugin'
            'gst-plugins-bad: Additional audio codecs'
            'gst-plugins-ugly: Additional audio codecs'
            'spydaap-git: DAAP server/client')
checkdepends=('python-mox3'
              'python-pytest')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/exaile/exaile.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/-beta/beta/;s/-alpha/alpha/;s/-rc/rc/;s/-/+/g'
}

build() {
  cd "${_pkgname}"
  make PREFIX="/usr"

}

check() {
  cd "${_pkgname}"
  make PYTEST="py.test" test
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
