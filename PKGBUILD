# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.0+git20201114
pkgrel=1
pkgdesc="A daemon to provide haptic feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=(GPL3)
arch=(i686 x86_64 armv7h aarch64)
depends=(dconf
         gsound
         json-glib
         libgudev)
makedepends=(gobject-introspection
             meson
             vala)
provides=(libfeedback
          purism-feedbackd
          purism-libfeedback)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('e5da62d70906a9d92cdcfe7d04fe7d3131a4475a9b39599f27ac2da89b15de59')

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
