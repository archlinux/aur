# Maintainer: Gr3q <floyd0122@gmail.com>

_pkgname=yt-dlg
pkgname=$_pkgname
pkgver=1.8.5
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
sha512sums=('0377663acafc2554d37a93ca0c89cfb6ecd2020f29124267f8fb5cf675da5b7bb7892b4bd0f9bbb526d6035cbc0fcf68dffa846b9bb9e01a4d7c59fb5d132a50')


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