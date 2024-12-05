# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dimitris Kiziridis <dkiziridis at outlook dot com>

pkgname=tartube
pkgver=2.5.062
pkgrel=1
pkgdesc='A GUI front-end for youtube-dl, yt-dlp and other compatible video downloaders'
arch=('any')
url='https://github.com/axcore/tartube'
license=('LGPL-2.1-or-later')
depends=('gdk-pixbuf2'
         'glib2'
         'gtk3'
         'libnotify'
         'pango'
         'python'
         'python-gobject'
         'python-requests'
         'yt-dlp')
optdepends=('aria2: external downlader for youtube-dl'
            'atomicparsley: support for embedding thumbnails in audio files'
            'ffmpeg: support for various post-processing tasks'
            'python-feedparser: support for detecting livestreams'
            'python-matplotlib: support for drawing graphs'
            'python-moviepy: support for detecting length of some videos'
            'python-playsound: play alarm when a livestream starts'
            'streamlink: support for downloading livestreams')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/axcore/tartube/archive/v${pkgver}.tar.gz")
sha256sums=('e967b887da8cc07e8172e21fb16f370d2951b76f6040dd921c990fcc696289f6')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 pack/tartube.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 pack/tartube.desktop -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
