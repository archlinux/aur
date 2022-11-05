# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_pkgname=music21
pkgname=python-$_pkgname
pkgver=8.1.0
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
sha256sums=('0fd00078fd9bfcc4f0c6e36d44fd6e5bb5b8506c6acba3796941b568a2cf64ad')

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
