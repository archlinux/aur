# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.0+git20200420
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
sha256sums=('4c50d72654b6716fd12843ad4e9460a4020bbd1ced958c211c06b0f48bebe49f')

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
