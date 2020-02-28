# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.0+git20200214
pkgrel=1
pkgdesc="A daemon to provide haptic feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=(GPL3 LGPL3)
arch=(i686 x86_64 armv6h armv7h)
depends=('gsound'
         'gobject-introspection')
makedepends=('meson'
             'pkg-config')
provides=(feedbackd
          libfeedback
          purism-feedbackd
          purism-libfeedback)
source=("https://source.puri.sm/Librem5/feedbackd/-/archive/v${pkgver}/feedbackd-v${pkgver}.tar.gz")
sha256sums=('df0e570e4831f423dbbe3191479ca716e0aa071d07a166ec46c7560b0723212d')

build() {
	rm -rf build
	arch-meson "feedbackd-v${pkgver}" build -Dexamples=false -Dgtk_doc=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}
