# Maintainer: j-james <jj@j-james.me>
pkgname=ensembles
_pkgname=Ensembles
pkgver=0.0.17
pkgrel=3
pkgdesc="A digital arranger workstation powered by FluidSynth for GNOME"
arch=('x86_64')
url='https://github.com/SubhadeepJasu/Ensembles'
license=('GPL3')
depends=(
	'gtk3'
	'granite'
	'glib2'
	'libhandy'
	'fluidsynth'
	'soundfont-ensembles'
)
optdepends=(
	'gtk-theme-elementary: for dark theme support'
	'portmidi: MIDI controller support'
	'lv2: support for lv2 virtual instruments and effects plugins'
	'lilv: allows Ensembles to act as a lv2 host'
	'suil: support for lv2'
)
makedepends=('git' 'meson' 'ninja' 'vala')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4801eed59d0801e223ca8c9c7294f6128083161d09e9dc438ca345255ffc0952')

build() {
	cd "$_pkgname-$pkgver"

	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$_pkgname-$pkgver"

	DESTDIR="$pkgdir/" ninja -C build install
}
