# Maintainer: Christoph Reiter <reiter.christoph@gmail.com>

pkgname=quodlibet-git
pkgver=r9120.37e477f1e
pkgrel=1
pkgdesc="An audio library tagger, manager and player"
arch=('any')
license=('GPL2')
url="https://quodlibet.readthedocs.io"
depends=('gtk3' 'python2-gobject' 'python2-dbus' 'python2-cairo' 'mutagen' 
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 
         'desktop-file-utils' 'python2-futures' 'python2-feedparser'
         'python2-faulthandler')
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
source=(${pkgname}::git+https://github.com/quodlibet/quodlibet.git)
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}/quodlibet
  python2 setup.py build
}

package() {
  cd ${pkgname}/quodlibet
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
