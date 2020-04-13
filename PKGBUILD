# Maintainer: Christoph Reiter <reiter.christoph@gmail.com>

pkgname=quodlibet-git
pkgver=r10393.ed4d84575
pkgrel=1
pkgdesc="An audio library tagger, manager and player"
arch=('any')
license=('GPL2')
url="https://quodlibet.readthedocs.io"
depends=('gtk3' 'python-gobject' 'python-dbus' 'python-cairo' 'python-mutagen'
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly'
         'desktop-file-utils' 'python-feedparser')
makedepends=('gettext')
optdepends=('gst-libav: for ffmpeg (ASF/WMA) support'
            'gst-plugins-bad: for Musepack support'
            'libkeybinder3: for the multimedia keys support'
            'python-musicbrainzngs: for "MusicBrainz Lookup" plugin'
            'python-pyinotify: for "Automatic library update" plugin'
            'kakasi: for "Kana/Kanji Simple Inverter" plugin'
            'gst-plugins-bad: for "Audio Pitch/Speed" plugin')
provides=('quodlibet')
conflicts=('quodlibet')
options=('!makeflags')
source=(${pkgname}::git+https://github.com/quodlibet/quodlibet.git)
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python3 setup.py build
}

package() {
  cd ${pkgname}
  python3 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
