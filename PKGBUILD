# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dimitris Kiziridis <dkiziridis at outlook dot com>

pkgname=tartube
pkgver=2.5.0
pkgrel=1
pkgdesc='A GUI front-end for youtube-dl, yt-dlp and other compatible video downloaders'
arch=('any')
url='https://github.com/axcore/tartube'
license=('LGPL-2.1-or-later')
depends=('gobject-introspection-runtime'
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
sha256sums=('efa80c9da2c3c63e261f9eda0f81b60cf90093a6f5d25b80ab569c29f3f6f350')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" pack/tartube.png
  install -Dm644 -t "${pkgdir}/usr/share/applications/" pack/tartube.desktop
}
# vim:set ts=2 sw=2 et:
