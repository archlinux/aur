# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.0+git20200707
pkgrel=1
pkgdesc="A daemon to provide haptic feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=(GPL3 LGPL3)
arch=(i686 x86_64 armv6h armv7h aarch64)
depends=(dconf
         gsound
         json-glib
         libgudev)
makedepends=(gobject-introspection
             meson
             pkg-config
             vala)
provides=(libfeedback
          purism-feedbackd
          purism-libfeedback)
source=("https://source.puri.sm/Librem5/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('37cf48cbdbaee8e2d0bea406f5b6317bf0e3cdf79250f9ce0a884e7d3905a8ea')

build() {
	rm -rf build
	arch-meson "${pkgname}-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
