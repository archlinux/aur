# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.1
pkgrel=1
pkgdesc='A daemon to provide haptic feedback on events'
arch=(x86_64 aarch64)
url='https://source.puri.sm/Librem5/feedbackd'
license=(GPL3)
depends=(
	dconf
	gsound
	json-glib
	libgudev
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('cbbcf82f2141be03a5c1e8259257fa158f8bfa366cbd56d93e728ac4c504fb9591ebee723ff5128e5d1db6c50d7226754f233edd8f08239d550f3287f517f8a5')

build() {
	arch-meson "${pkgname}-v${pkgver}" build -Dgtk_doc=true -Dman=true
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
