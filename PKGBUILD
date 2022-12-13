# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname
pkgver=1.8.4
pkgrel=1
pkgdesc="A cross platform front-end GUI of the popular yt-dlp written in wxPython (maintained fork of youtube-dl-gui)"
arch=('any')
url="https://github.com/oleksis/youtube-dl-gui"
license=('custom:UNLICENSE')
depends=(
  'python-pypubsub'
  'python-wxpython'
  'xdg-utils'
)
optdepends=('ffmpeg: convert video files to audio-only files'
            'youtube-dl: alternative to the youtube-dl program downloaded by yt-dlg')
makedepends=(
	'python-polib'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
provides=($_pkgname)
conflicts=($_pkgname youtube-dl-gui)
source=(https://github.com/oleksis/youtube-dl-gui/archive/refs/tags/v"${pkgver}".tar.gz)
sha512sums=('906474132746da9f80d361992bfa562b845ed305bbb0077359c8b43a8a82ed90d2144c3c33431183c8d3454b7a59bb4cc107cfa69f115c126b3a006210d8a8b7')


build() {
	cd youtube-dl-gui-"${pkgver}"
	python setup.py build_trans
	python -m build --wheel --no-isolation
}

package() {
  cd youtube-dl-gui-"${pkgver}"
  install -Dm644 yt-dlg.desktop "$pkgdir/usr/share/applications/yt-dlg.desktop"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}