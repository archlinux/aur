# Maintainer: Eldred Habert <me@eldred.fr>
pkgname=pymusiclooper
pkgver=3.4.2
pkgrel=1
pkgdesc="A program for repeating music endlessly and creating seamless music loops, with play/export/tagging support"
arch=('any')
url="https://github.com/arkrow/PyMusicLooper"
license=('MIT')
groups=()
# sounddevice 0.5.0 is normally required, but that package is not available yet.
# numpy 1.x is normally required, but this requires grabbing an AUR package instead.
#   Using 2.0 *hasn't* appeared to break thus far, so...
depends=('python>=3.9' 'python-librosa>=0.10.2' 'python-numpy>=1.25.0'
         'python-soundfile>=0.12.1' 'python-sounddevice>=0.4.6' 'yt-dlp>=2024.8.6'
         'python-rich-click>=1.8.0' 'python-rich>=13.4.2' 'python-pytaglib>=3.0.0'
         'python-numba>=0.59.1' 'python-click-params>=0.5.0'
         'python-click-option-group>=0.5.6' 'python-lazy-loader>=0.3')
makedepends=(python-build python-installer python-wheel 'python-poetry-core>=1.0.0' 'python-setuptools>=67.0.0')
optdepends=('ffmpeg: for supporting additional audio formats')
source=("pymusiclooper-$pkgver.tar.gz::https://github.com/arkrow/PyMusicLooper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c741d9092091def30b9b751b1a9bd94e4269bf453b99a4614eee8b824a8686d')

build() {
	cd "PyMusicLooper-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "PyMusicLooper-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm 644 LICENSE "$pkgdir/usr/share/licenses/pymusiclooper/LICENSE"
}
