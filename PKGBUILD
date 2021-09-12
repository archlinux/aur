# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad
pkgver=3.4
pkgrel=1
pkgdesc='Python API for building LilyPond files'
arch=('any')
url="https://github.com/Abjad/abjad"
license=('GPL3')
groups=('abjad')
depends=(
	'lilypond'
	'python>=3.6'
	'python-ply'
	'python-six'
	## deps below are AUR only
	'python-quicktions>=1.3'
	'python-roman'
	'python-uqbar>=0.4.4')
makedepends=('python-setuptools')
optdepends=(
	'fluidsynth: playback generated MIDI files'
	'timidity++: playback generated MIDI files'
	'graphviz: creates rhythm-trees graphs and other tree structures')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b92f33c6d625dd89d88edaa0cd2f5c826875f271f77eeb325272edc087b6ac4')
# validpgpkeys=('EF80D3D6F5926FC997919D6A27A5BE0A6ADE7F36') ## Trevor Baca

build() {
	cd "abjad-$pkgver"
	python setup.py build
}

package() {
	cd "abjad-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
