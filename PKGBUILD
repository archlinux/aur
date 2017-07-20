# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: 1213 <lambertacampo at gmail dot com>

_pkgname=exaile
pkgname=${_pkgname}-git
pkgver=4.0.0.beta2.r27.g643975c2
pkgrel=1
pkgdesc="music player for gnome, similar to KDEs amarok"
arch=('x86_64' 'i686')
url="http://www.exaile.org"
license=('GPL')
depends=('gtk3' 'gstreamer' 'mutagen' 'python2-dbus'
         'python2-gobject' 'python2-cairo' 'udisks2' 'librsvg' 'gst-plugins-good')
makedepends=('git' 'help2man')
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
            'cinnamon-screensaver: Pause on screensaver plugin')

provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/exaile/exaile.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
