# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad
pkgver=3.5
pkgrel=1
pkgdesc='Python API for building LilyPond files'
arch=('any')
url="https://github.com/Abjad/abjad"
license=('GPL3')
groups=('abjad')
depends=(
	'lilypond'
	'python>=3.10'
	'python-ply'
	'python-six'
	## deps below are AUR only
	'python-quicktions'
	'python-roman'
	'python-uqbar')
makedepends=(
	'git'
	'python-setuptools'
	'python-build'
	'python-install'
	'python-wheel')
optdepends=(
	'fluidsynth: playback generated MIDI files'
	'timidity++: playback generated MIDI files'
	'graphviz: creates rhythm-trees graphs and other tree structures')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd94e679c8e948ea2992840b64143679f2fd327297a5fa4151e0e492d4430d22')
# validpgpkeys=('EF80D3D6F5926FC997919D6A27A5BE0A6ADE7F36') ## Trevor Baca

build() {
	cd "abjad-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

## tests segfault
# check() {
# 	cd "abjad-$pkgver"
# 	pytest -x -c /dev/null
# }

package() {
	export PYTHONHASHSEED=0
	cd "abjad-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
