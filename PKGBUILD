# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.14.0
pkgrel=1
pkgdesc='Virtual keyboard supporting Wayland, built primarily for the Librem 5 phone'
url='https://source.puri.sm/Librem5/squeekboard'
license=(GPL3)
arch=(x86_64 aarch64)
depends=(
	feedbackd
	gnome-desktop
	python
)
makedepends=(
	pkg-config
	meson
	intltool
	rust
	gtk-doc
)
source=("${url}/-/archive/v${pkgver}/squeekboard-v${pkgver}.tar.gz")
sha256sums=('cc83ade8d507d7651e15c07ddf749450f72bdff0d650598b45f3395e47ddda38')

build() {
	arch-meson "squeekboard-v${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
