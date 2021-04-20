# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.13.0
pkgrel=1
pkgdesc="Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone"
url="https://source.puri.sm/Librem5/squeekboard"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=(
	'feedbackd'
	'gnome-desktop'
	'python'
)
makedepends=(
	'pkg-config'
	'meson'
	'intltool'
	'rust'
	'gtk-doc'
)
source=("${url}/-/archive/v${pkgver}/squeekboard-v${pkgver}.tar.gz")
sha256sums=('ec9f53c0706dd049e2dd2a480ff62b13ad75a298874998e757f61e3958579723')

build() {
	arch-meson "squeekboard-v${pkgver}" build -Dtests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
