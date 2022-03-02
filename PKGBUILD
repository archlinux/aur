# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

## Do not use git source; tree contains massive objects

pkgname=python-abjad
pkgver=3.6
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
	'python-installer'
	'python-wheel')
optdepends=(
	'fluidsynth: playback generated MIDI files'
	'timidity++: playback generated MIDI files'
	'graphviz: creates rhythm-trees graphs and other tree structures')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('482f883f5385994ff073a91368f8c9be1c89e8ad4897006e0168a19ef5137ae1')
# validpgpkeys=('EF80D3D6F5926FC997919D6A27A5BE0A6ADE7F36') ## Trevor Baca

build() {
	cd "abjad-$pkgver"
	python -m build --wheel --no-isolation
}

## tests segfault
# check() {
# 	cd "abjad-$pkgver"
# 	pytest -x -c /dev/null
# }

package() {
	export PYTHONHASHSEED=0
	cd "abjad-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
