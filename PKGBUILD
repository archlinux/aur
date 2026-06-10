# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=10.3.0
pkgrel=1
pkgdesc="A toolkit for computer-aided musical analysis"
arch=('any')
url="http://web.mit.edu/music21"
license=('BSD')
depends=(
	'python-chardet'
	'python-joblib'
	'python-more-itertools'
	'python-requests'
	'python-webcolors'
)
optdepends=(
	'lilypond: PDF or PNG output with music21.converter'
	'python-jsonpickle: pickle and unpickle objects with music21.freezeThaw'
	'python-matplotlib: graphing support'
	'python-pillow: high quality output from LilyPond'
	'python-pyaudio: allows recording with music21.audioSearch'
	'python-pygame: allows realtime MIDI performance with music21.midi'
	'python-scipy: faster FFT for music21.audioSearch'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-wheel'
)
source=("https://github.com/cuthbertLab/music21/archive/v${pkgver}.tar.gz")
sha256sums=('e2ba9c5bb724dc328517cc87bd8deff74feda824c832d1a542d1f951ca0e05a2')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
