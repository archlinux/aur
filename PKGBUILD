# Maintainer: norbert.pfeiler ät gmail.com

_ghuser=jcupitt
_name=vipsdisp
pkgname=$_name-git
pkgver=2.4.1+3.g1f28388
pkgrel=1
pkgdesc='displays an image with libvips and gtk+4; can display huge images quickly and without using much memory; supports many scientific and technical image formats.'
url=https://github.com/$_ghuser/$_name
license=(unknown)
arch=(x86_64)
provides=($_name)
makedepends=(git meson cmake)
depends=(libvips openjpeg2 gtk4)
source=(git+$url)

prepare() {
	meson setup build $_name --prefix /usr --libexecdir=lib --sbindir=bin --sharedstatedir=share --buildtype=release
}
pkgver() {
	git -C $_name describe --always --dirty --tags | sed 's/-/+/; s/-/./; s/v//' | sed 's/:/;/g; s|/|\\\\|g; s/ /~/g'
}
build() {
	meson configure build
	meson compile -C build
}
check() {
	meson test -C build
}
package() {
	env DESTDIR=$pkgdir meson install -C build
}
sha256sums=('SKIP')
