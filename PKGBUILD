# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.2
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
b2sums=('088047712fc1cce219bd1fe6b7f82883eb9806ff6b14f932012f42dc13ff12958a807b0a64e88c56bd1f89b4e4da4c0b78400960fc71f3a7ac4c3e78c14f8341')

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
