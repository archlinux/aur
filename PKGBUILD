# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.0+git20211018
pkgrel=1
pkgdesc='A daemon to provide haptic feedback on events'
url='https://source.puri.sm/Librem5/feedbackd'
license=(GPL3)
arch=(x86_64 aarch64)
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
sha256sums=('52e075f4020ad2b69c38cc732942d06c84b68105058da9a86e8861d5df2dc647')

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
