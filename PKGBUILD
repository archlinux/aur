# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

## Do not use git source; tree contains massive objects

pkgname=python-abjad
pkgver=3.10
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
	'graphviz: creates rhythm-trees graphs and other tree structures'
	'python-abjad-ext-ipython: IPython extension'
	'python-abjad-ext-nauert: quantization extension'
	'python-abjad-ext-rmakers: rhythm-maker extension'
	'timidity++: playback generated MIDI files')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fac112fdf87142c58cdf5598b2d8eafa935f436d0290a142a02e3e48eeac7cbe')
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
	cd "abjad-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
