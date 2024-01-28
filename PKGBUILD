# Maintainer: jtagcat <arch-3ff61201@jtag.cat>

pkgname=alsa-gobject
pkgver=0.3.0
pkgrel=1
pkgdesc='ALSA libraries compatible with GObject introspection (g-i) for language bindings (direct kernel usage, no alsa-lib wrappers).'
arch=('x86_64')
url='https://github.com/alsa-project/alsa-gobject'
license=('LGPL-3.0')
depends=(
	gobject-introspection
	libgobject-2.0.so
	libglib-2.0.so
)
provides=(
	libalsactl.so
	libalsatimer.so
	libalsaseq.so
	libalsahwdep.so
	libalsarawmidi.so
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('aeaf58aaf242454e3c88ab0aca6c3c296994a433b1154ff48f3a731f1744cc7991fcc4c8185a20aab91e6ad5a4a0951fb6787c81a5343a92087a9f3c9ba23f24')
b2sums=('578c96060d8b6be8d5276a906e1c6c053e55fbf24090b9ac1b87148b281c30ae03248c69282aa7424a68fd4df3c59200b3f8aaca25bc00a91e6e0962f139888d')

makedepends=(
	cmake
	meson
	python-gobject # tests
)

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
