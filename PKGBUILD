# Maintainer: Adrian Sampson <adrian@radbox.org>
# Contributor: Johannes Löthberg <demizide@gmail.com>

pkgname=beets-git
pkgver=1.4.9.r42.g81b1faa05
pkgrel=1
pkgdesc="Flexible music library manager and tagger - git version"
arch=('any')
url="http://beets.io/"
license=('MIT')
depends=('python-six' 'python-unidecode' 'python-musicbrainzngs'
         'python-yaml' 'python-mediafile' 'python-confuse'
         'python-munkres' 'python-jellyfish')
makedepends=('python-setuptools' 'git')
optdepends=('python-requests: absubmit, fetchart, embyupdate, kodiupdate, lyrics, plexupdate plugins'
            'python-pillow: fetchart, embedart, thumbnails plugins'
            'python-pyacoustid: chroma plugin'
            'python-gobject: bpd, replaygain plugins'
            'python-gmusicapi: gmusic plugin'
            'python-discogs-client: discogs plugin'
            'python-requests-oauthlib: beatport plugin'
            'python-pylast: lastgenre, lastimport plugins'
            'python-beautifulsoup4: lyrics plugin'
            'python-mpd2: mpdstats plugin'
            'python-flask: web plugin'
            'python-flask-cors: web plugin'
            'python-rarfile: import plugin'
            'python-xdg: thumbnails plugin'
            'python-dbus: metasync plugin'
            'python-soco: sonosupdate plugin'
            'python-mutagen: scrub plugin'
            'chromaprint: chroma plugin'
            'ffmpeg: convert plugin'
            'mp3val: badfiles plugin'
            'flac: badfiles plugin'
            'gstreamer: bpd, replaygain plugins'
            'imagemagick: embedart plugin'
            'essentia-acousticbrainz: absubmit plugin'
            'keyfinder: keyfinder plugin'
            'mp3gain: replaygain plugin'
            'aacgain: replaygain plugin'
            'audiotools: replaygain plugin'
            'go-ipfs: ipfs plugin')
provides=('beets')
conflicts=('beets')
source=('git+https://github.com/beetbox/beets.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/beets
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/beets
  python setup.py build
}

package() {
  cd ${srcdir}/beets
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
