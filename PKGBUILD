# Maintaner: Jesse G <isa3laws@gmail.com>

pkgname=resonance
pkgver=0.1.3
pkgrel=1
arch=('x86_64')
pkgdesc='An intuitive GTK4/LibAdwaita music player'
url='https://github.com/nate-xyz/resonance'
license=('GPL3')
depends=('rust' 'gtk4' 'gstreamer' 'gst-plugins-base' 'gst-plugins-bad'
	'libadwaita' 'python-tqdm' 'python-mutagen' 'python-loguru')
makedepends=('git' 'meson' 'ninja')
provides=("resonance=${pkgver}")
source=("git+${url}.git#commit=72cc1d2")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	arch-meson "${srcdir}/${pkgname}" build --prefix=/usr
	meson compile -C build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
}
