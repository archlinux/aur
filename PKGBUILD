# Maintainer: Christoph Reiter <reiter.christoph@gmail.com>

pkgname=quodlibet-git
_srcname=quodlibet
pkgver=r7848.84a0f2e
pkgrel=2
pkgdesc="An audio library tagger, manager and player"
arch=('any')
license=('GPL2')
url="https://github.com/quodlibet/quodlibet"
depends=('gtk3' 'python2-gobject' 'python2-dbus' 'python2-cairo' 'mutagen' 
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 
	 'desktop-file-utils' 'python2-futures' 'python2-feedparser')
makedepends=('intltool')
optdepends=('gst-libav: for ffmpeg (ASF/WMA) support'
            'gst-plugins-bad: for Musepack support'
            'libkeybinder3: for the multimedia keys support'
            'media-player-info: for media devices support'
            'python2-musicbrainzngs: for "MusicBrainz Lookup" plugin'
            'python2-pyinotify: for "Automatic library update" plugin'
	    'kakasi: for "Kana/Kanji Simple Inverter" plugin'
            'gst-plugins-bad: for "Audio Pitch/Speed" plugin')
provides=('quodlibet-plugins' 'quodlibet') 
conflicts=('quodlibet-plugins' 'quodlibet')
replaces=('quodlibet-plugins')
options=('!makeflags')
install=${pkgname}.install
source=(${pkgname}::git+https://github.com/quodlibet/quodlibet.git)
sha1sums=('SKIP')

build() {
  cd ${pkgname}/quodlibet
  python2 setup.py build
}

package() {
  cd ${pkgname}/quodlibet
  python2 setup.py install --root="${pkgdir}"
}

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
																			
